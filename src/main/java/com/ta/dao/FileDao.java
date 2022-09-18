package com.ta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.ta.dto.ChattingRoomFileDto;
import com.ta.dto.FileDto;
import com.ta.dto.RecentlyImgOrFileDto;
import com.ta.dto.WorkspaceListDto;

public class FileDao {
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
	// 파일 리스트
	public ArrayList<WorkspaceListDto> getFileWorkspaceList(int loginId){
		ArrayList<WorkspaceListDto> list = new ArrayList<WorkspaceListDto>();
		try {
			String sql ="SELECT w.workspace_id, w.workspace_name " + 
					"FROM workspace w, workspace_mb wm " + 
					"WHERE w.workspace_id = wm.workspace_id " + 
					"AND wm.member_id = ?";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int workspaceId = rs.getInt("workspace_id");
				String workspaceName = rs.getString("workspace_name");
				list.add(new WorkspaceListDto(workspaceId, workspaceName));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 모든공간 최근파일
	public ArrayList<RecentlyImgOrFileDto> getAllWorkspaceRecentlyFile(int loginId){
		ArrayList<RecentlyImgOrFileDto> list = new ArrayList<RecentlyImgOrFileDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT f.file_id,  f.file_name " + 
					"FROM files f, workspace w, document d " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND f.document_id = d.document_id " +
					"AND f.document_id IN (SELECT document_id " + 
					"FROM document " + 
					"WHERE workspace_id IN (SELECT workspace_id FROM workspace_mb WHERE member_id = ?)) " + 
					"AND (f.file_name NOT LIKE '%.jpg%' "+
					"AND f.file_name NOT LIKE '%.png%' "+
					"AND f.file_name NOT LIKE '%.svg%') "+
					"ORDER BY f.file_date DESC";	
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			rs = pstmt.executeQuery();
			for(int i=1; i<=3; i++) { // 파일명 
				if(rs.next()) {
					int file_id = rs.getInt("file_id");
					String file_name = rs.getString("file_name");
					list.add(new RecentlyImgOrFileDto(file_id, file_name));
				}
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 모든공간 최근 이미지
	public ArrayList<RecentlyImgOrFileDto> getAllWorkspaceRecentlyImg(int loginId){
		ArrayList<RecentlyImgOrFileDto> list = new ArrayList<RecentlyImgOrFileDto>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT f.file_id,  f.file_name " + 
					"FROM files f, workspace w, document d " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND f.document_id = d.document_id " +
					"AND f.document_id IN (SELECT document_id " + 
					"FROM document " + 
					"WHERE workspace_id IN (SELECT workspace_id FROM workspace_mb WHERE member_id = ?)) " + 
					"AND (f.file_name LIKE '%.jpg%' "+
					"AND f.file_name LIKE '%.png%' "+
					"AND f.file_name LIKE '%.svg%') "+
					"ORDER BY f.file_date DESC";	
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			rs = pstmt.executeQuery();
			for(int i=1; i<=3; i++) { // 파일명 
				if(rs.next()) {
					int file_id = rs.getInt("file_id");
					String file_name = rs.getString("file_name");
					list.add(new RecentlyImgOrFileDto(file_id, file_name));
				}
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 선택한공간 최근파일
	public ArrayList<RecentlyImgOrFileDto> getSelectWorkspaceRecentlyFile(int workspaceId){
		ArrayList<RecentlyImgOrFileDto> list = new ArrayList<RecentlyImgOrFileDto>();
		try {
			String sql = "SELECT f.file_id, f.file_name " + 
					"FROM files f, workspace w, document d " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND f.document_id = d.document_id " +
					"AND f.document_id IN (SELECT document_id FROM document WHERE workspace_id = ?) " + 
					"AND (f.file_name NOT LIKE '%.jpg%' "+
					"AND f.file_name NOT LIKE '%.png%' "+
					"AND f.file_name NOT LIKE '%.svg%') "+
					"ORDER BY f.file_id DESC";	
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspaceId);
			ResultSet rs = pstmt.executeQuery();
			for(int i=1; i<=3; i++) { // 파일명 
				if(rs.next()) {
					int file_id = rs.getInt("file_id");
					String file_name = rs.getString("file_name");
					list.add(new RecentlyImgOrFileDto(file_id,file_name));
				}
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 선택한공간 최근 이미지
	public ArrayList<RecentlyImgOrFileDto> getSelectWorkspaceRecentlyImg(int workspaceId){
		ArrayList<RecentlyImgOrFileDto> list = new ArrayList<RecentlyImgOrFileDto>();
		try {
			String sql = "SELECT f.file_id, f.file_name " + 
					"FROM files f, workspace w, document d " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND f.document_id = d.document_id " +
					"AND f.document_id IN (SELECT document_id FROM document WHERE workspace_id = ?) " + 
					"AND (f.file_name LIKE '%.jpg%' "+
					"OR f.file_name LIKE '%.png%' "+
					"OR f.file_name LIKE '%.svg%') "+
					"ORDER BY f.file_id DESC";	
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspaceId);
			ResultSet rs = pstmt.executeQuery();
			for(int i=1; i<=3; i++) { // 파일명 
				if(rs.next()) {
					int file_id = rs.getInt("file_id");
					String file_name = rs.getString("file_name");
					list.add(new RecentlyImgOrFileDto(file_id,file_name));
				}
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 모든공간 전체파일
	public ArrayList<FileDto> getAllWorkspaceTotalFile(int loginId){
		ArrayList<FileDto> list = new ArrayList<FileDto>();
		try {
			String sql = "SELECT f.picture, f.file_id, w.workspace_name, f.file_name " + 
					"FROM files f, workspace w, document d " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND f.document_id = d.document_id " +
					"AND f.document_id IN (SELECT document_id " + 
					"FROM document " + 
					"WHERE workspace_id IN (SELECT workspace_id FROM workspace_mb WHERE member_id = ?)) " + 
					"ORDER BY f.file_date DESC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				String picture = rs.getString("picture");
				int file_id = rs.getInt("file_id");
				String workspace_name = rs.getString("workspace_name");
				String file_name = rs.getString("file_name");
				list.add(new FileDto(picture, file_id, workspace_name, file_name));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 모든공간 전체파일 -> 검색
		public ArrayList<FileDto> getSearchAllWorkspaceTotalFile(int loginId,String search){
			ArrayList<FileDto> list = new ArrayList<FileDto>();
			try {
				String sql = "SELECT f.picture, f.file_id, w.workspace_name, f.file_name " + 
						"FROM files f, workspace w, document d " + 
						"WHERE w.workspace_id = d.workspace_id " + 
						"AND f.document_id = d.document_id " +
						"AND f.document_id IN (SELECT document_id " + 
						"FROM document " + 
						"WHERE workspace_id IN (SELECT workspace_id FROM workspace_mb WHERE member_id = ?)) " + 
						"AND f.file_name LIKE ? " +
						"ORDER BY f.file_date DESC";
				Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, loginId);
				pstmt.setString(2, "%"+search+"%"); 
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) { 
					String picture = rs.getString("picture");
					int file_id = rs.getInt("file_id");
					String workspace_name = rs.getString("workspace_name");
					String file_name = rs.getString("file_name");
					list.add(new FileDto(picture, file_id, workspace_name, file_name));
				}
				rs.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	// 모든공간 내파일
	public ArrayList<FileDto> getAllWorkspaceMyFile(int loginId){
		ArrayList<FileDto> list = new ArrayList<FileDto>();
		try {
			String sql = "SELECT f.picture, f.file_id, w.workspace_name, f.file_name " + 
					"FROM files f, workspace w, document d " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND f.document_id = d.document_id " +
					"AND f.post = ? " + 
					"ORDER BY f.file_date DESC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				String picture = rs.getString("picture");
				int file_id = rs.getInt("file_id");
				String workspace_name = rs.getString("workspace_name");
				String file_name = rs.getString("file_name");
				list.add(new FileDto(picture, file_id, workspace_name, file_name));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 모든공간 내파일 -> 검색
		public ArrayList<FileDto> getSearchAllWorkspaceMyFile(int loginId,String search){
			ArrayList<FileDto> list = new ArrayList<FileDto>();
			try {
				String sql = "SELECT f.picture, f.file_id, w.workspace_name, f.file_name " + 
						"FROM files f, workspace w, document d " + 
						"WHERE w.workspace_id = d.workspace_id " + 
						"AND f.document_id = d.document_id " +
						"AND f.post = ? " + 
						"AND f.file_name LIKE ? " +
						"ORDER BY f.file_date DESC";
				Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, loginId);
				pstmt.setString(2, "%"+search+"%"); 
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) { 
					String picture = rs.getString("picture");
					int file_id = rs.getInt("file_id");
					String workspace_name = rs.getString("workspace_name");
					String file_name = rs.getString("file_name");
					list.add(new FileDto(picture, file_id, workspace_name, file_name));
				}
				rs.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	// 선택한공간에서 전체파일
	public ArrayList<FileDto> getSelectWorkspaceTotalFile(int workspaceId){
		ArrayList<FileDto> list = new ArrayList<FileDto>();
		try {
			String sql = "SELECT f.picture, f.file_id, w.workspace_name, f.file_name " + 
					"FROM files f, workspace w, document d " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND f.document_id = d.document_id " +
					"AND f.document_id IN (SELECT document_id FROM document WHERE workspace_id = ?) " + 
					"ORDER BY f.file_date DESC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspaceId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				String picture = rs.getString("picture");
				int file_id = rs.getInt("file_id");
				String workspace_name = rs.getString("workspace_name");
				String file_name = rs.getString("file_name");
				list.add(new FileDto(picture, file_id, workspace_name, file_name));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 선택한공간에서 전체파일 -> 검색
		public ArrayList<FileDto> getSearchSelectWorkspaceTotalFile(int loginId,String search, int workspaceId){
			ArrayList<FileDto> list = new ArrayList<FileDto>();
			try {
				String sql = "SELECT f.picture, f.file_id, w.workspace_name, f.file_name " + 
						"FROM files f, workspace w, document d " + 
						"WHERE w.workspace_id = d.workspace_id " + 
						"AND f.document_id = d.document_id " +
						"AND f.document_id IN (SELECT document_id FROM document WHERE workspace_id = ?) " + 
						"AND f.file_name LIKE ? " +
						"ORDER BY f.file_date DESC";
				Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, workspaceId);
				pstmt.setString(2, "%"+search+"%"); 
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) { 
					String picture = rs.getString("picture");
					int file_id = rs.getInt("file_id");
					String workspace_name = rs.getString("workspace_name");
					String file_name = rs.getString("file_name");
					list.add(new FileDto(picture, file_id, workspace_name, file_name));
				}
				rs.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
			return list;
		}
	// 선택한공간에서 내파일
	public ArrayList<FileDto> getSelectWorkspaceMyFile(int loginId, int workspaceId){
		ArrayList<FileDto> list = new ArrayList<FileDto>();
		try {
			String sql = "SELECT f.picture, f.file_id, w.workspace_name, f.file_name " + 
					"FROM files f, workspace w, document d " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND f.document_id = d.document_id " +
					"AND f.document_id IN (SELECT document_id FROM document WHERE workspace_id = ?) " + 
					"AND f.post = ? " + 
					"ORDER BY f.file_date DESC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspaceId);
			pstmt.setInt(2, loginId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				String picture = rs.getString("picture");
				int file_id = rs.getInt("file_id");
				String workspace_name = rs.getString("workspace_name");
				String file_name = rs.getString("file_name");
				list.add(new FileDto(picture, file_id, workspace_name, file_name));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 선택한공간 내파일  -> 검색
	public ArrayList<FileDto> getSearchSelectWorkspaceMyFile(int loginId,String search, int workspaceId){
		ArrayList<FileDto> list = new ArrayList<FileDto>();
		try {
			String sql = "SELECT f.picture, f.file_id, w.workspace_name, f.file_name " + 
					"FROM files f, workspace w, document d " + 
					"WHERE w.workspace_id = d.workspace_id " + 
					"AND f.document_id = d.document_id " +
					"AND f.document_id IN (SELECT document_id FROM document WHERE workspace_id = ?) " + 
					"AND f.post = ? " + 
					"AND f.file_name LIKE ? " +
					"ORDER BY f.file_date DESC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspaceId);
			pstmt.setInt(2, loginId);
			pstmt.setString(3, "%"+search+"%"); 
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				String picture = rs.getString("picture");
				int file_id = rs.getInt("file_id");
				String workspace_name = rs.getString("workspace_name");
				String file_name = rs.getString("file_name");
				list.add(new FileDto(picture, file_id, workspace_name, file_name));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 채팅 파일
	public ArrayList<ChattingRoomFileDto> getChattingRoomFile(int chatting_room_id){
		ArrayList<ChattingRoomFileDto> list = new ArrayList<ChattingRoomFileDto>();
		try {
			String sql = "SELECT file_id, file_name, f.picture AS file_picture, " + 
					"	TO_CHAR(file_date,'mm\"월\" dd\"일\" am hh:mi') AS file_date, m.picture, m.name " + 
					"	FROM files f, member m, chatting_room cr  " + 
					"	WHERE f.chatting_room_id = cr.chatting_room_id " + 
					"	AND f.post = m.member_id " + 
					"	AND cr.chatting_room_id = ? " +
					" ORDER BY file_date ASC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chatting_room_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int file_id = rs.getInt("file_id");
				String file_picture = rs.getString("file_picture");
				String file_name = rs.getString("file_name");
				String file_date = rs.getString("file_date");
				String picture = rs.getString("picture");
				String name = rs.getString("name");
				list.add(new ChattingRoomFileDto(file_id,file_name,file_date,picture,name,file_picture));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	// 채팅 파일 검색
	public ArrayList<ChattingRoomFileDto> getSearchChattingRoomFile(int chatting_room_id, String search){
		ArrayList<ChattingRoomFileDto> list = new ArrayList<ChattingRoomFileDto>();
		try {
			String sql = "SELECT file_id, file_name, f.picture AS file_picture, " + 
					"	TO_CHAR(file_date,'mm\"월\" dd\"일\" am hh:mi') AS file_date, m.picture, m.name " + 
					"	FROM files f, member m, chatting_room cr  " + 
					"	WHERE f.chatting_room_id = cr.chatting_room_id " + 
					"	AND f.post = m.member_id " + 
					"	AND cr.chatting_room_id = ? " +
					" 	AND f.file_name LIKE ? ";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, chatting_room_id);
			pstmt.setString(2, "%"+search+"%");
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int file_id = rs.getInt("file_id");
				String file_picture = rs.getString("file_picture");
				String file_name = rs.getString("file_name");
				String file_date = rs.getString("file_date");
				String picture = rs.getString("picture");
				String name = rs.getString("name");
				list.add(new ChattingRoomFileDto(file_id,file_name,file_date,picture,name,file_picture));
				rs.close();
				pstmt.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
