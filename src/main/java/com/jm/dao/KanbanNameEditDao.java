package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class KanbanNameEditDao {

	// 문서상태 이름변경 
	void kanbanNameEdit(String n_kanban_name, String kanban_id) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "UPDATE Kanban SET kanban_name = ? where kanban_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n_kanban_name);
			pstmt.setString(2, kanban_id);
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
