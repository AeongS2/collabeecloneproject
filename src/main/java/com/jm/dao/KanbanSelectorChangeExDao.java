package com.jm.dao;

import java.sql.*;

public class KanbanSelectorChangeExDao {
	// 원래 속해있던 칸반아이디 docu들 한칸씩 땡기기
	public void KanbanSelectorChangeEx(String exKanban_id){
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT count(*) FROM kanban_document WHERE kanban_id = ?";
		int cnt = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, exKanban_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String sql1 ="UPDATE kanban_document SET kanban_do_order = ? WHERE kanban_do_order = ? AND kanban_id = ?";
		for(int i =1; i<= cnt; i++) {
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, i);
				pstmt.setInt(2, (i+1));
				pstmt.setString(3, exKanban_id);
				pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		System.out.println("한칸씩땡김!");
		
	}
}
