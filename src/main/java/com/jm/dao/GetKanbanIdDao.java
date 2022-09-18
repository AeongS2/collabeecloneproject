package com.jm.dao;

import java.sql.*;

public class GetKanbanIdDao {
	public String GetKanbanId(int workspace_id) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT kanban_id FROM kanban WHERE workspace_id = ? AND kanban_order = 0";
		String kanban_id = "";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				kanban_id = rs.getString("kanban_id");
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return kanban_id;
	}
}
