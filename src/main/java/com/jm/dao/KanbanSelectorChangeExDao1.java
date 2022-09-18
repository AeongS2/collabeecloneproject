package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class KanbanSelectorChangeExDao1 {
	public String KanbanSelectorChangeEx1(int document_id) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql2 = "SELECT kanban_id FROM kanban_document WHERE document_id=?";
		String exKanban_id = "";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, document_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				exKanban_id = rs.getString(1);
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return exKanban_id;
		
	}
}
