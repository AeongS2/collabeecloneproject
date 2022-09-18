package com.ta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ta.dto.ChattingContentsDto;
import com.ta.dto.ChattingDto;
import com.ta.dto.ChattingFileDto;
import com.ta.dto.ChattingLinkDto;
import com.ta.dto.ChattingMessageFileDto;
import com.ta.dto.ChattingMessageLinkDto;
import com.ta.dto.ChattingParticipantsDto;

public class ChattingDao {
	static ArrayList<Integer> userChattingAlarm = new ArrayList<Integer>();
	public ArrayList<ChattingDto> getChattingRoomName(int chatting_room_id) {
		ArrayList<ChattingDto> list = new ArrayList<ChattingDto>();
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT chatting_room_id, chatting_name FROM chatting_room WHERE chatting_room_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chatting_room_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int chattingRoomId = rs.getInt("chatting_room_id");
				String chattingRoomName = rs.getString("chatting_name");
				list.add(new ChattingDto(chattingRoomId, chattingRoomName));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ChattingMessageFileDto> getChattingMessageFile(int fileId){
		ArrayList<ChattingMessageFileDto> list = new ArrayList<ChattingMessageFileDto>();
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT file_id, file_name, picture FROM files WHERE file_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fileId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String file_name = rs.getString("file_name");
				String picture = rs.getString("picture");
				list.add(new ChattingMessageFileDto(file_name, picture));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ChattingMessageLinkDto> getChattingMessageLink(int linkId){
		ArrayList<ChattingMessageLinkDto> list = new ArrayList<ChattingMessageLinkDto>();
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT link_name,link_title,picture, link_explanation FROM links WHERE link_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, linkId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String link_name = rs.getString("link_name");
				String link_title = rs.getString("link_title");
				String link_picture = rs.getString("picture");
				String link_explanation = rs.getString("link_explanation");
				list.add(new ChattingMessageLinkDto(link_name,link_title,link_explanation,link_picture));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public String getChattingMainName(int loginId){
		String chattingMainName = null;
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "SELECT corporation_id FROM member WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			rs = pstmt.executeQuery();
			boolean b = false;
			if(rs.next()) { 
				int corporation_id = rs.getInt(1);
				if(corporation_id == 0)
					b = true;
			}
			rs.close();
			pstmt.close();
			if(b) { // 회사가 없는사람 채팅 대문짝만한 본인 이름
				sql = "SELECT name FROM member WHERE member_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, loginId);
				rs = pstmt.executeQuery();
				if(rs.next()) { 
					chattingMainName = rs.getString("name");
				} 
				rs.close();
				pstmt.close();
			} else if(b == false){ // 회사가 있는사람 채팅 대문짝만한 회사 이름
				sql = "SELECT c.corporation_name FROM member m, corporations c WHERE m.corporation_id = c.corporation_id AND m.member_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, loginId);
				rs = pstmt.executeQuery();
				if(rs.next()) { 
					chattingMainName = rs.getString("corporation_name");
				}
				rs.close();
				pstmt.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return chattingMainName;
	}
	public ArrayList<ChattingDto> getGroupChattingList(int loginId) {
		ArrayList<ChattingDto> list = new ArrayList<ChattingDto>();
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "SELECT cr.chatting_room_id, chatting_name FROM chatting_room cr, chatting_room_member crm WHERE cr.chatting_room_id = crm.chatting_room_id AND cr.workspace_id IS NULL AND crm.chatting_member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {  
				int chatting_room_id = rs.getInt("chatting_room_id");
				String chatting_name = rs.getString("chatting_name");
				list.add(new ChattingDto(chatting_room_id,chatting_name));
			}
			rs.close();
			pstmt.close();		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ChattingDto> getWorkspaceChattingNameList(int loginId) throws SQLException {
		ArrayList<ChattingDto> list = new ArrayList<ChattingDto>();
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT cr.chatting_room_id, chatting_name FROM chatting_room cr, chatting_room_member crm WHERE cr.chatting_room_id = crm.chatting_room_id AND cr.workspace_id IS NOT NULL AND crm.chatting_member_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, loginId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) { // 협업공간 대화방 목록
			int chatting_room_id = rs.getInt("chatting_room_id");
			String chatting_name = rs.getString("chatting_name");
			list.add(new ChattingDto(chatting_room_id, chatting_name));
		}
		rs.close();
		pstmt.close();	
		return list;
	}
	public static String picture(String file_name) { // 파일 이미지
		String pictureType = file_name.substring(file_name.length()-4,file_name.length());
		if(pictureType.equals(".jpg")) {
			return "img";
		} else if(pictureType.equals(".png")) {
			return "img";
		} else if(pictureType.equals(".svg")) {
			return "img";
		} else if(pictureType.equals("pptx")) {
			return "pptx";
		} else if(pictureType.equals("xlsx")) {
			return "xlsx";
		} else if(pictureType.equals(".zip")) {
			return "zip";
		} else if(pictureType.equals("docx")) {
			return "docx";
		} else if(pictureType.equals(".pdf")) {
			return "pdf";
		} else
			return "etc";
	}
	public void insertFileChatting(int loginId, int chattingRoomId, String file_name) { // 채팅에 파일추가
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO files(file_id, document_id, post, chatting_room_id, file_name, file_date, picture) " + 
					"VALUES(file_id.nextval, null, ?, ?, ?, sysdate, ?)";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setInt(2, chattingRoomId);
			pstmt.setString(3, file_name);
			pstmt.setString(4, picture(file_name));
			pstmt.executeUpdate(); 			
			pstmt.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	public ArrayList<ChattingContentsDto> getChattingContents(int chattingRoomId) { 
		ArrayList<ChattingContentsDto> list = new ArrayList<ChattingContentsDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT message_id, m.picture, m.name, message, TO_CHAR(send_time,'mm/dd am hh:mi') AS send_time,file_id,link_id " + 
					"FROM chatting_message cm, member m " + 
					"WHERE m.member_id = cm.talking_member_id " + 
					"AND chatting_room_id = ? " +
					"ORDER BY send_time";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			rs = pstmt.executeQuery();
			while(rs.next()) {  
				int message_id = rs.getInt("message_id");
				String picture = rs.getString("picture");
				String name = rs.getString("name");
				String message = rs.getString("message");
				String send_time = rs.getString("send_time");
				int file_id = rs.getInt("file_id");
				int link_id = rs.getInt("link_id");
				ChattingContentsDto dto = new ChattingContentsDto(message_id,picture,name,message,send_time, file_id, link_id);
				list.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public void insertChattingMessage(int loginId, int chattingRoomId, String content) { // 채팅 메세지 insert
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO chatting_message(message_id, chatting_room_id, talking_member_id, message, send_time, reader, file_id, link_id) VALUES(message_id.nextval, ?, ?, ?, sysdate, 0, 0, 0);";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			pstmt.setInt(2, loginId);
			pstmt.setString(3, content);
			pstmt.executeUpdate(); 			
			pstmt.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	public static int returnChattingFileId(String fileName, int loginId, int chattingRoomId) {
		int fileId=0;
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT file_id FROM files WHERE post = ? AND file_name = ? AND chatting_room_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setString(2, fileName);
			pstmt.setInt(3, chattingRoomId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				fileId = rs.getInt("file_id");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return fileId;
	}
	public void insertChattingFileMessage(String fileName, int loginId, int chattingRoomId) { // 채팅 파일 메세지insert
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO chatting_message(message_id, chatting_room_id, talking_member_id, message, send_time, reader, file_id, link_id) VALUES(message_id.nextval, ?, ?, null, sysdate, 0, ?, 0)";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			pstmt.setInt(2, loginId);
			pstmt.setInt(3, returnChattingFileId(fileName, loginId, chattingRoomId));
			pstmt.executeUpdate(); 			
			pstmt.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	public void insertChattingLink(int loginId, int chattingRoomId, int linkId) { // 채팅 링크 insert
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO chatting_message(message_id, chatting_room_id, talking_member_id, link_id, send_time, reader) VALUES(message_id.nextval, ?, ?, ?, sysdate, ?);";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			pstmt.setInt(2, loginId);
			pstmt.setInt(3, linkId);
			pstmt.setInt(4, loginId);
			pstmt.executeUpdate(); 			
			pstmt.close();
		} catch (Exception e){
		e.printStackTrace();
		}
	}
	public boolean getchattingRoomAlarm(int loginId, int chattingRoomId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean alarmState = false;
		try {
			String sql = "SELECT alarm FROM chatting_room_member WHERE chatting_member_id = ? AND chatting_room_id =?";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setInt(2, chattingRoomId);
			rs = pstmt.executeQuery();
			if(rs.next()) {  
				int alarm = rs.getInt("alarm");
				if(alarm == 1) alarmState = true;
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return alarmState;
	}
	public ArrayList<ChattingParticipantsDto> getChattingParticipants(int chattingRoomId){
		ArrayList<ChattingParticipantsDto> list = new ArrayList<ChattingParticipantsDto>();
		try {
		String	sql = "SELECT m.name, m.picture " + 
					"FROM chatting_room_member crm,chatting_room cr,member m " + 
					"WHERE crm.chatting_room_id = cr.chatting_room_id " + 
					"AND crm.chatting_member_id = m.member_id " + 
					"AND crm.chatting_room_id =?";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String name = rs.getString("name");
				String picture = rs.getString("picture");
				list.add(new ChattingParticipantsDto(name,picture));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ChattingParticipantsDto> getInviteChattingMemver(int member_id){
		ArrayList<ChattingParticipantsDto> list = new ArrayList<ChattingParticipantsDto>();
		try {
			String	sql = "SELECT name, picture " + 
						"FROM member " + 
						"WHERE member_id = ? " ;
				Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, member_id);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					String name = rs.getString("name");
					String picture = rs.getString("picture");
					list.add(new ChattingParticipantsDto(name,picture));
				}
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
	}
	public int getCountChattingParticipants(int chattingRoomId) {
		int numberOfParticipants=0;
		try {
			String sql = "SELECT COUNT(m.name) " + 
					"FROM chatting_room_member crm,chatting_room cr,member m " + 
					"WHERE crm.chatting_room_id = cr.chatting_room_id " + 
					"AND crm.chatting_member_id = m.member_id " + 
					"AND crm.chatting_room_id =?";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				numberOfParticipants = rs.getInt("COUNT(m.name)");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return numberOfParticipants;
	}
	public boolean checkInviteMemberRedundancy(int chatting_room_id, int member_id) {
		int count = 0;
		try {
			System.out.println(chatting_room_id);
			System.out.println(member_id);
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT COUNT(*) AS count FROM chatting_room_member WHERE chatting_room_id = ? AND chatting_member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chatting_room_id);
			pstmt.setInt(2, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		if(count==1) {
			return false;
		} else {
			return true;
		}
	}
	
	public boolean inviteMemberToChattingRoom(int chattingRoomId, int member_id) {
		boolean inviteCheck = false;
		try { 
			PreparedStatement pstmt = null;
			Connection conn = DBConnection.getConnection();
			String sql = "INSERT INTO chatting_room_member(chatting_room_id,chatting_member_id) VALUES(?,?) ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			pstmt.setInt(2, member_id);
			if(pstmt.executeUpdate()==1) {
				inviteCheck = true;
			} else {
				inviteCheck =  false;
			}
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return inviteCheck;
	}
	public void oneHour(int loginId) { // 방해금지모드 1시간
		String date = "sysdate+1/24";
		notDisturbMode(loginId,date);
		
	}
	public void twoHour(int loginId) { // 방해금지모드 2시간
		String date = "sysdate+2/24";
		notDisturbMode(loginId,date);
	}
	public void fourHour(int loginId) { // 방해금지모드 4시간
		String date = "sysdate+4/24";
		notDisturbMode(loginId,date);
	}
	public void oneDay(int loginId) { // 방해금지모드 다음날 그시간까지
		String date = "sysdate+1";
		notDisturbMode(loginId,date);
	}
	public static void notDisturbMode(int loginId, String date) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		for(int i=0; i<=userChattingAlarm.size()-1; i++) userChattingAlarm.remove(i);
		try {
			String sql = "SELECT chatting_room_id FROM chatting_room_member WHERE alarm = '0' AND chatting_member_id = ?";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int chatting_room_id = rs.getInt("chatting_room_id");
				userChattingAlarm.add(chatting_room_id);
			}
			String offAlarm = userChattingAlarm.toString().substring(1,userChattingAlarm.toString().length()-1);
			sql = "UPDATE message_alarm SET chatting_room_alarm = ?, clear_date = ? WHERE member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, date);
			pstmt.setString(2, offAlarm);
			pstmt.setInt(3, loginId);
			pstmt.executeUpdate(); 			
			pstmt.close();
			sql = "UPDATE chatting_room_member SET alarm = 0 WHERE chatting_member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.executeUpdate(); 			
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void notDisturbModeDone(int loginId) { // 방해금지 모드가 끝나고 다시 알람을 켜줌
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String chatting_room_alarm = userChattingAlarm.toString().substring(1,userChattingAlarm.toString().length()-1);
		try {
			String sql = "UPDATE chatting_room_member SET alarm = 1 " + 
					  "WHERE chatting_member_id =? AND chatting_room_id NOT IN (?)"; 
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setString(2, chatting_room_alarm);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(SQLException e) {
				e.printStackTrace();
		}
	}
	public ArrayList<ChattingFileDto> getTotalChattingFile(int loginId){
		ArrayList<ChattingFileDto> list = new ArrayList<ChattingFileDto>();
		try {
			String sql = "SELECT f.file_id, f.file_name, TO_CHAR(f.file_date,'mm\"월\" dd\"일\" am hh:mi') AS file_date, cr.chatting_name, m.picture " + 
					"FROM files f, member m, chatting_room cr , chatting_room_member crm " + 
					"WHERE f.chatting_room_id = cr.chatting_room_id " + 
					"AND f.post = m.member_id " + 
					"AND cr.chatting_room_id = crm.chatting_room_id " + 
					"AND cr.chatting_room_id IS NOT NULL " + 
					"AND crm.chatting_member_id = ? " ;
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int file_id = rs.getInt("file_id");
				String file_name = rs.getString("file_name");
				String file_date = rs.getString("file_date");
				String chatting_name = rs.getString("chatting_name");
				String picture = rs.getString("picture");
				list.add(new ChattingFileDto(file_id, file_name, file_date, chatting_name, picture));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ChattingFileDto> getSearchTotalChattingFile(int loginId, String search){
		ArrayList<ChattingFileDto> list = new ArrayList<ChattingFileDto>();
		try {
			String sql = "SELECT f.file_id, f.file_name, TO_CHAR(f.file_date,'mm\"월\" dd\"일\" am hh:mi') AS file_date, cr.chatting_name, m.picture " + 
					"FROM files f, member m, chatting_room cr , chatting_room_member crm " + 
					"WHERE f.chatting_room_id = cr.chatting_room_id " + 
					"AND f.post = m.member_id " + 
					"AND cr.chatting_room_id = crm.chatting_room_id " + 
					"AND cr.chatting_room_id IS NOT NULL " + 
					"AND crm.chatting_member_id = ? " +
					"AND f.file_name LIKE ?";
			
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setString(2, search);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int file_id = rs.getInt("file_id");
				String file_name = rs.getString("file_name");
				String file_date = rs.getString("file_date");
				String chatting_name = rs.getString("chatting_name");
				String picture = rs.getString("picture");
				list.add(new ChattingFileDto(file_id, file_name, file_date, chatting_name, picture));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ChattingFileDto> getSelectChattingFile(int chattingRoomId){
		ArrayList<ChattingFileDto> list = new ArrayList<ChattingFileDto>();
		try {
			String sql = "SELECT file_id, file_name, TO_CHAR(file_date,'mm\"월\" dd\"일\" am hh:mi') AS file_date, cr.chatting_name, m.picture " + 
					"FROM files f, member m, chatting_room cr " + 
					"WHERE f.chatting_room_id = cr.chatting_room_id " + 
					"AND f.post = m.member_id " + 
					"AND cr.chatting_room_id = ? " ;
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int file_id = rs.getInt("file_id");
				String file_name = rs.getString("file_name");
				String file_date = rs.getString("file_date");
				String chatting_name = rs.getString("chatting_name");
				String picture = rs.getString("picture");
				list.add(new ChattingFileDto(file_id, file_name, file_date, chatting_name, picture));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ChattingFileDto> getSearchSelectChattingFile(int chattingRoomId, String search){
		ArrayList<ChattingFileDto> list = new ArrayList<ChattingFileDto>();
		try {
			String sql = "SELECT file_id, file_name, TO_CHAR(file_date,'mm\"월\" dd\"일\" am hh:mi') AS file_date, cr.chatting_name, m.picture " + 
					"FROM files f, member m, chatting_room cr " + 
					"WHERE f.chatting_room_id = cr.chatting_room_id " + 
					"AND f.post = m.member_id " + 
					"AND cr.chatting_room_id = ? " +
					"AND f.file_name LIKE ?";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			pstmt.setString(2, search);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int file_id = rs.getInt("file_id");
				String file_name = rs.getString("file_name");
				String file_date = rs.getString("file_date");
				String chatting_name = rs.getString("chatting_name");
				String picture = rs.getString("picture");
				list.add(new ChattingFileDto(file_id, file_name, file_date, chatting_name, picture));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ChattingLinkDto> getTotalChattingLink(int loginId){
		ArrayList<ChattingLinkDto> list = new ArrayList<ChattingLinkDto>();
		try {
			String sql = "SELECT l.link_id, l.link_title, l.link_explanation, l.link_name, TO_CHAR(l.link_date,'mm\"월\" dd\"일\" am hh:mi') AS link_date, cr.chatting_name, m.picture " + 
					"FROM links l, member m, chatting_room cr , chatting_room_member crm " + 
					"WHERE l.chatting_room_id = cr.chatting_room_id " + 
					"AND l.post = m.member_id " + 
					"AND cr.chatting_room_id = crm.chatting_room_id " + 
					"AND cr.chatting_room_id IS NOT NULL " + 
					"AND crm.chatting_member_id = ? ";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int link_id = rs.getInt("link_id");
				String link_title = rs.getString("link_title");
				String link_explanation = rs.getString("link_explanation");
				String link_name = rs.getString("link_name");
				String link_date = rs.getString("link_date");
				String chatting_name = rs.getString("chatting_name");
				String picture = rs.getString("picture");
				list.add(new ChattingLinkDto(link_id,link_title,link_explanation,link_name,link_date,chatting_name,picture));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ChattingLinkDto> getSearchTotalChattingLink(int loginId, String search){
		ArrayList<ChattingLinkDto> list = new ArrayList<ChattingLinkDto>();
		try {
			String sql = "SELECT l.link_id, l.link_title, l.link_explanation, l.link_name, TO_CHAR(l.link_date,'mm\"월\" dd\"일\" am hh:mi') AS link_date, cr.chatting_name, m.picture " + 
					"FROM links l, member m, chatting_room cr , chatting_room_member crm " + 
					"WHERE l.chatting_room_id = cr.chatting_room_id " + 
					"AND l.post = m.member_id " + 
					"AND cr.chatting_room_id = crm.chatting_room_id " + 
					"AND cr.chatting_room_id IS NOT NULL " + 
					"AND crm.chatting_member_id = ? " +
					"AND (l.link_title LIKE ? " +
					"OR l.link_name LIKE ?)";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setNString(2, "%"+search+"%");
			pstmt.setNString(3, "%"+search+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int link_id = rs.getInt("link_id");
				String link_title = rs.getString("link_title");
				String link_explanation = rs.getString("link_explanation");
				String link_name = rs.getString("link_name");
				String link_date = rs.getString("link_date");
				String chatting_name = rs.getString("chatting_name");
				String picture = rs.getString("picture");
				list.add(new ChattingLinkDto(link_id,link_title,link_explanation,link_name,link_date,chatting_name,picture));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ChattingLinkDto> getSelectChattingLink(int loginId, int chattingRoomId){
		ArrayList<ChattingLinkDto> list = new ArrayList<ChattingLinkDto>();
		try {
			String sql = "SELECT l.link_id, l.link_title, l.link_explanation, l.link_name, TO_CHAR(l.link_date,'mm\"월\" dd\"일\" am hh:mi') AS link_date, cr.chatting_name, m.picture " + 
					"FROM links l, member m, chatting_room cr " + 
					"WHERE l.chatting_room_id = cr.chatting_room_id " + 
					"AND l.post = m.member_id " + 
					"AND cr.chatting_room_id = ? " ;
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int link_id = rs.getInt("link_id");
				String link_title = rs.getString("link_title");
				String link_explanation = rs.getString("link_explanation");
				String link_name = rs.getString("link_name");
				String link_date = rs.getString("link_date");
				String chatting_name = rs.getString("chatting_name");
				String picture = rs.getString("picture");
				list.add(new ChattingLinkDto(link_id,link_title,link_explanation,link_name,link_date,chatting_name,picture));
			}
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
		e.printStackTrace();
		}
		return list;
	}
	public ArrayList<ChattingLinkDto> getSearchSelectChattingLink(int loginId, int chattingRoomId, String search){
		ArrayList<ChattingLinkDto> list = new ArrayList<ChattingLinkDto>();
		try {
			String sql = "SELECT l.link_id, l.link_title, l.link_explanation, l.link_name, TO_CHAR(l.link_date,'mm\"월\" dd\"일\" am hh:mi') AS link_date, cr.chatting_name, m.picture " + 
					"FROM links l, member m, chatting_room cr " + 
					"WHERE l.chatting_room_id = cr.chatting_room_id " + 
					"AND l.post = m.member_id " + 
					"AND cr.chatting_room_id = ? " +
					"AND (l.link_title LIKE ? " +
					"OR l.link_name LIKE ?)";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			pstmt.setNString(2, "%"+search+"%");
			pstmt.setNString(3, "%"+search+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int link_id = rs.getInt("link_id");
				String link_title = rs.getString("link_title");
				String link_explanation = rs.getString("link_explanation");
				String link_name = rs.getString("link_name");
				String link_date = rs.getString("link_date");
				String chatting_name = rs.getString("chatting_name");
				String picture = rs.getString("picture");
				list.add(new ChattingLinkDto(link_id,link_title,link_explanation,link_name,link_date,chatting_name,picture));
			}
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
		e.printStackTrace();
		}
		return list;
	}
}	

