package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NewKanbanDao {

	// 협업공간 생성시 자동으로 발의됨, 진행중, 일시중지, 완료 칸반 생성
	void newKanban(int workspace_id) {
		
		Connection conn = DBConnection.getConnection();
		
		String[] n_kanban_id = new String[4];
		String[] str = new String[] {"발의됨", "진행중", "일시중지", "완료"};
		int num = 0;
		for(int i = 0; i<n_kanban_id.length; i++) {
			num++;
			n_kanban_id[i] = workspace_id + "_" + num; // 문서상태 id 만들기
			
			String sql = "INSERT INTO kanban VALUES ( ?, ?, ?, ?, ?)";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, workspace_id);
				pstmt.setString(2, n_kanban_id[i]);
				pstmt.setString(3, str[i]);
				pstmt.setInt(4, num);
				pstmt.setInt(5, num);
				pstmt.executeUpdate();
				
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
	}
	
}
