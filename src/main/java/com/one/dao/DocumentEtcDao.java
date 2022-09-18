package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DocumentEtcDao {
	public int getDocumentBookmark(int document_id, int member_id) {
		String sql ="SELECT count(bookmark_id) \"bookmark\" FROM bookmark WHERE document_id = ? AND member_id = ?";
		int result=0;
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  document_id);
			pstmt.setInt(2,  member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("bookmark");
				result++;
			} 
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return result;
	}
	
	public int getDocumentAlarm(int document_id, int member_id) {
		String sql = "SELECT count(document_alarm_id) \"alarm\" FROM document_alarm WHERE document_id = ? AND member_id = ?";
		int result=0;
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  document_id);
			pstmt.setInt(2,  member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				int cnt = rs.getInt("alarm");
				result++;
			} 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}
