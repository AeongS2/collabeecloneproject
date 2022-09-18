package com.jm.dao;

import java.sql.*;
import java.util.ArrayList;

public class KanbanDocuOrderUpdateDao {
	
	// 칸반안에 문서 순서 업데이트
	public void kanbanDocuOrderUpdate(int index, String kanban_id, int document_id) {
		Connection conn = DBConnection.getConnection();	
		
		String sql ="UPDATE kanban_document SET kanban_do_order=? WHERE kanban_id = ? AND document_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			pstmt.setString(2, kanban_id);
			pstmt.setInt(3, document_id);
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
