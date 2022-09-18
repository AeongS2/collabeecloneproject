package com.jm.dao;

import java.sql.*;

public class TodoCurSelectorDao {
	public int TodoCurSelector(String todo_cur_id_str, int todo_id) {
		
		Connection conn = DBConnection.getConnection();
		
		int todo_cur_id = 0;
		if(todo_cur_id_str.trim().equals("할당됨")) {
			todo_cur_id = 1;
		}else if(todo_cur_id_str.trim().equals("진행 중")) {
			todo_cur_id = 2;
		}else if(todo_cur_id_str.trim().equals("일시중지")) {
			todo_cur_id=3;
		}else if(todo_cur_id_str.trim().equals("완료")) {
			todo_cur_id=4;
		}else if(todo_cur_id_str.trim().equals("확인 요청")) {
			todo_cur_id=5;
		}
		
		System.out.println(todo_cur_id);
		
		String sql = "UPDATE todo SET todo_cur_id = ? WHERE todo_id = ?";
		int result = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, todo_cur_id);
			pstmt.setInt(2, todo_id);
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
}
