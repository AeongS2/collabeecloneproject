package com.jm.dao;

import java.sql.*;

public class KanbanSelectorChangeDIdDao {
	public int KanbanSelectorChangeDId(int bookmark_id) {
		
		Connection conn = DBConnection.getConnection();

		String sql = "SELECT document_id FROM bookmark WHERE bookmark_id = ?";
		int document_id = -1;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookmark_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				document_id = rs.getInt("document_id");
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return document_id;
	}
}
