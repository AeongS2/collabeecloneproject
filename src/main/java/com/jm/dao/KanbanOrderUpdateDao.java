package com.jm.dao;

import java.sql.*;

public class KanbanOrderUpdateDao {
	// 칸반 순서 업데이트
	public void kanbanOrderUpdate(int index, String kanban_id) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "UPDATE kanban SET kanban_order = ? WHERE kanban_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			pstmt.setString(2, kanban_id);
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
