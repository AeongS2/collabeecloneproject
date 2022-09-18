package com.ta.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.ta.dto.ChattingRoomFileDto;
import com.ta.dto.ChattingRoomLinkDto;
import com.ta.dto.LinkDto;
import com.ta.dto.RecentlyLinkDto;

public class LinkDao {
	public String linkTitle(String link_name) { 
		Document doc = null;
		try {
			doc = Jsoup.connect(link_name).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String title = doc.title();
		return title;
	}
	public String linkExplanation(String link_name) { 
		Document doc = null;
		try {
			doc = Jsoup.connect(link_name).get();
		} catch(IOException e){
			e.printStackTrace();
		}
		Elements elm = doc.select("[name="+"description"+"]"); 
		String explanation = elm.toString();
		String linkExplanation = explanation.substring(explanation.indexOf("content=")+9,explanation.length()-2);
		return linkExplanation;
	}
	public String linkPicture(String link_name) {
		Document doc = null;
		try {
			doc = Jsoup.connect(link_name).get();
		} catch(IOException e){
			e.printStackTrace();
		}
		Elements elm = doc.select("[property=\"og:image\"]"); 
		String picture = elm.toString();
		String linkPicture = picture.substring(picture.indexOf("content=")+9,picture.length()-2);
		return linkPicture;
	}
//	public boolean linkCheck(String link) {
//		int cnt=0;
//		StringTokenizer st = new StringTokenizer(link,".");
//		while(st.hasMoreTokens()) {
//			st.nextToken();
//			cnt++;
//		}
//		if((link.substring(0,3).equals("http") || link.substring(0,4).equals("https") || link.substring(0,2).equals("wwww")) && (cnt-1)>=2) {
//	
//		}	
//	}
	public void insertLinkDocument(int loginId, int workspaceId, String link) { // 문서에서 링크 올릴때 --> 수정필요
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO links(link_id, document_id, post, chatting_room_id, link_name, link_title, link_explanation, link_date, picture) " + 
					"VALUES (link_id.nextval, ?, ?, null, ?, ?, ?, sysdate, ?)";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspaceId);
			pstmt.setInt(2, loginId);
			pstmt.setString(3, link);
			pstmt.setString(4, linkTitle(link) ); 
			pstmt.setString(5, linkExplanation(link) );
			pstmt.setString(6, linkPicture(link));
			pstmt.executeUpdate(); 			
			pstmt.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	public void insertLinkChatting(int loginId, int chattingRoomId, String link) { // 채팅에서 링크 올릴때  --> 수정필요
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO links(link_id, document_id, post, chatting_room_id, link_name, link_title, link_explanation, link_date, picture) " + 
					"VALUES (link_id.nextval, null, ?, ?, ?, ?, ?, sysdate, ?)";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chattingRoomId);
			pstmt.setInt(2, loginId);
			pstmt.setString(3, link);
			pstmt.setString(4, linkTitle(link) ); 
			pstmt.setString(5, linkExplanation(link) );
			pstmt.setString(6, linkPicture(link));
			pstmt.executeUpdate(); 			
			pstmt.close();
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	public boolean getCheckAllWorkspaceRecentlyLink() {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int checkAllWorkspaceRecentlyLinks=0;
		try {
			String sql = "SELECT DISTINCT COUNT(l.link_id) AS link_id " + 
					"FROM links l, workspace w, document d " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND l.document_id = d.document_id " + 
					"AND l.chatting_room_id IS NULL " +
					"ORDER BY l.link_id DESC";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				checkAllWorkspaceRecentlyLinks = rs.getInt("link_id"); 
			}
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		if(checkAllWorkspaceRecentlyLinks==0) {
			return false;
		} else
			return true;
	}
	public ArrayList<ChattingRoomLinkDto> getChattingRoomLink(int chatting_room_id){
		ArrayList<ChattingRoomLinkDto> list = new ArrayList<ChattingRoomLinkDto>();
		try {
			String sql = "SELECT link_id, link_name, l.picture AS link_picture, l.link_title, l.link_explanation, " + 
					" TO_CHAR(link_date,'mm\"월\" dd\"일\" am hh:mi') AS link_date, m.picture, m.name " + 
					" FROM links l, member m, chatting_room cr " + 
					" WHERE l.chatting_room_id = cr.chatting_room_id " + 
					" AND l.post = m.member_id " + 
					" AND cr.chatting_room_id = ? " + 
					" ORDER BY link_date ASC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chatting_room_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int link_id = rs.getInt("link_id");
				String link_picture = rs.getString("link_picture");
				String link_name = rs.getString("link_name");
				String link_date = rs.getString("link_date");
				String link_title = rs.getString("link_title");
				String link_explanation = rs.getString("link_explanation");
				String picture = rs.getString("picture");
				String name = rs.getString("name");
				list.add(new ChattingRoomLinkDto(link_id,link_picture,link_name,link_title,link_explanation,link_date,name,picture));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<RecentlyLinkDto> getAllWorkspaceRecentlyLink() { 
		ArrayList<RecentlyLinkDto> list = new ArrayList<RecentlyLinkDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT l.link_id, l.link_title " + 
					"FROM links l, workspace w, document d " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND l.document_id = d.document_id " + 
					"AND l.chatting_room_id IS NULL " +
					"ORDER BY l.link_id DESC";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			for(int i=1; i<=3; i++) {
				if(rs.next()) {
					int link_id = rs.getInt("link_id");
					String link_title = rs.getString("link_title");
					list.add(new RecentlyLinkDto(link_id,link_title));
				}
			}	
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<LinkDto> getAllWorkspaceMyLink(int loginId, String search){
		ArrayList<LinkDto> list = new ArrayList<LinkDto>();
		try {
			String sql = "SELECT l.picture, l.link_id, w.workspace_name, d.title, l.link_name, l.link_title, l.link_explanation, m.picture AS profile " + 
					"FROM links l, workspace w, document d, member m " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND l.document_id = d.document_id " + 
					"AND m.member_id = l.post " +
					"AND l.post = ? " + 
					"AND l.chatting_room_id IS NULL " +
					"AND (link_name LIKE ? " +
					"OR link_title LIKE ?) " +
					"ORDER BY l.link_date DESC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String linkPicture = rs.getString("picture");
				int link_id = rs.getInt("link_id");
				String workspace_name = rs.getString("workspace_name");
				String title = rs.getString("title");
				String link_name = rs.getString("link_name");
				String link_title = rs.getString("link_title");
				String link_explanation = rs.getString("link_explanation");
				String picture = rs.getString("profile");
				list.add(new LinkDto(linkPicture,link_id,workspace_name,title,link_name,link_title,link_explanation,picture));
			}	
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<LinkDto> getAllWorkspaceTotalLink(int loginId, String search){
		ArrayList<LinkDto> list = new ArrayList<LinkDto>();
		try {
			String sql = "SELECT l.picture, l.link_id, w.workspace_name, d.title, l.link_name, l.link_title, l.link_explanation, m.picture AS profile " + 
					"FROM links l, workspace w, document d, member m " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND l.document_id = d.document_id " + 
					"AND m.member_id = l.post " +
					"AND l.document_id IN (SELECT document_id " + 
					"FROM document " + 
					"WHERE workspace_id IN (SELECT workspace_id FROM workspace_mb WHERE member_id = ?)) " + 
					"AND l.chatting_room_id IS NULL " +
					"AND (link_name LIKE ? " +
					"OR link_title Like ?) " +
					"ORDER BY l.link_date DESC ";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String linkPicture = rs.getString("picture");
				int link_id = rs.getInt("link_id");
				String workspace_name = rs.getString("workspace_name");
				String title = rs.getString("title");
				String link_name = rs.getString("link_name");
				String link_title = rs.getString("link_title");
				String link_explanation = rs.getString("link_explanation");
				String picture = rs.getString("profile");
				list.add(new LinkDto(linkPicture,link_id,workspace_name,title,link_name,link_title,link_explanation,picture));
			}	
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public boolean getCheckSelectWorkspaceRecentlyLink(int workspaceId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int checkSelectWorkspaceRecentlyLink=0;
		try {
			String sql = "SELECT DISTINCT COUNT(l.link_id) AS link_id" + 
					"FROM links l, workspace w, document d  " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND l.document_id = d.document_id " + 
					"AND l.chatting_room_id IS NULL " +
					"AND l.document_id IN (SELECT document_id FROM document WHERE workspace_id = ?) " + 
					"ORDER BY l.link_id DESC";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspaceId);
			rs = pstmt.executeQuery();
			for(int i=1; i<=3; i++) {
				if(rs.next()) {
					checkSelectWorkspaceRecentlyLink = rs.getInt("link_id");
				}
			}	
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		if(checkSelectWorkspaceRecentlyLink==0) {
			return false;
		} else {
			return true;
		}
	}
	public ArrayList<RecentlyLinkDto> getSelectWorkspaceRecentlyLink(int workspaceId) {
		ArrayList<RecentlyLinkDto> list = new ArrayList<RecentlyLinkDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT DISTINCT l.link_id, l.link_title " + 
					"FROM links l, workspace w, document d  " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND l.document_id = d.document_id " + 
					"AND l.chatting_room_id IS NULL " +
					"AND l.document_id IN (SELECT document_id FROM document WHERE workspace_id = ?) " + 
					"ORDER BY l.link_id DESC";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspaceId);
			rs = pstmt.executeQuery();
			for(int i=1; i<=3; i++) {
				if(rs.next()) {
					int link_id = rs.getInt("link_id");
					String link_title = rs.getString("link_title");
					list.add(new RecentlyLinkDto(link_id,link_title));
				}
			}	
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<LinkDto> getSelectWorkspaceTotalLink(String search, int workspaceId){
		ArrayList<LinkDto> list = new ArrayList<LinkDto>();
		try {
			String sql = "SELECT l.picture, l.link_id, w.workspace_name, d.title, l.link_name, l.link_title, l.link_explanation, m.picture AS profile " + 
					"FROM links l, workspace w, document d, member m " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND l.document_id = d.document_id " + 
					"AND m.member_id = l.post " +
					"AND l.document_id IN (SELECT document_id " + 
					"FROM document " + 
					"WHERE workspace_id = ?) " + 
					"AND l.chatting_room_id IS NULL " +
					"AND (link_name LIKE ? " +
					"OR link_title Like ?) " +
					"ORDER BY l.link_date DESC ";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspaceId);
			pstmt.setString(2, "%"+search+"%");
			pstmt.setString(3, "%"+search+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String linkPicture = rs.getString("picture");
				int link_id = rs.getInt("link_id");
				String workspace_name = rs.getString("workspace_name");
				String title = rs.getString("title");
				String link_name = rs.getString("link_name");
				String link_title = rs.getString("link_title");
				String link_explanation = rs.getString("link_explanation");
				String picture = rs.getString("profile");
				list.add(new LinkDto(linkPicture,link_id,workspace_name,title,link_name,link_title,link_explanation,picture));
			}	
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<LinkDto> getSelectWorkspaceMyLink(int loginId,String search, int workspaceId){
		ArrayList<LinkDto> list = new ArrayList<LinkDto>();
		try {
			String sql = "SELECT l.picture, l.link_id, w.workspace_name, d.title, l.link_name, l.link_title, l.link_explanation, m.picture AS profile " + 
					"FROM links l, workspace w, document d, member m " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND l.document_id = d.document_id " + 
					"AND m.member_id = l.post " +
					"AND l.document_id IN (SELECT document_id " + 
					"FROM document " + 
					"WHERE workspace_id = ?) " + 
					"AND l.post = ? " +		
					"AND l.chatting_room_id IS NULL " +
					"AND (link_name LIKE ? " +
					"OR link_title Like ?) " +
					"ORDER BY l.link_date DESC ";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspaceId);
			pstmt.setInt(2, loginId);
			pstmt.setString(3, "%"+search+"%");
			pstmt.setString(4, "%"+search+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String linkPicture = rs.getString("picture");
				int link_id = rs.getInt("link_id");
				String workspace_name = rs.getString("workspace_name");
				String title = rs.getString("title");
				String link_name = rs.getString("link_name");
				String link_title = rs.getString("link_title");
				String link_explanation = rs.getString("link_explanation");
				String picture = rs.getString("profile");
				list.add(new LinkDto(linkPicture,link_id,workspace_name,title,link_name,link_title,link_explanation,picture));
			}	
			rs.close();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
