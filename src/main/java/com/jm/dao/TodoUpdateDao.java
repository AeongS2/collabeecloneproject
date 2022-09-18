package com.jm.dao;

import java.sql.*;

public class TodoUpdateDao{
	
	public void todoUpdate(int todo_id, String content, String start_date, String finish_date, String des ) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql ="UPDATE todo SET content=?, start_date = to_date(?, 'YYYY/MM/DD'), finish_date = to_date(?, 'YYYY/MM/DD'), "
				+ "des = ?, edit_date = sysdate WHERE todo_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,content);
			pstmt.setString(2, start_date);
			pstmt.setString(3, finish_date);
			pstmt.setString(4, des);
			pstmt.setInt(5, todo_id);
			pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
