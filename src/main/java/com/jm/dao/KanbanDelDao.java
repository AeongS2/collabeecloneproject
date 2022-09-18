package com.jm.dao;

import java.sql.*;

public class KanbanDelDao {

	// 문서상태 삭제 (칸반에 속한 문서 없어야 가능)
	public int kanbanDelete(String kanban_id) {
		
		Connection conn = DBConnection.getConnection();
		
		// 선택한 문서상태에 문서있는지 확인
		int check = 0;
		String sql1 = "SELECT count(*) FROM kanban_document WHERE kanban_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, kanban_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				check = rs.getInt("count(*)");
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		// 없으면 지우기
		if(check == 0) {
			String sql2 = "delete from Kanban where kanban_id = ?";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, kanban_id);
				pstmt.executeUpdate();
				
				System.out.println("문서상태가 삭제되었습니다.");
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("문서가 있어 문서상태를 삭제할 수 없습니다. 문서를 이동시켜주세요");
		}
		
		return check;
	}
	
}
