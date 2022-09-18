package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BookmarkKanbanSelectorWIdDao {
	public int BookmarkKanbanSelectorWId(int bookmark_id) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql1 = "SELECT d.workspace_id "
				+ "FROM bookmark b, document d "
				+ "WHERE b.document_id = d.document_id AND bookmark_id = ?";
		int workspace_id = -1;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, bookmark_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				workspace_id = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		return workspace_id;
	}
} 
