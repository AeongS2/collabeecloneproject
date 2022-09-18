package com.jm.dao;

import java.sql.*;

public class TodoDetailDelDao {
	public int TodoDetailDel(int todo_id) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "DELETE FROM todo_pic WHERE todo_id =?";
		int result = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, todo_id);
			result += pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String sql1 = "DELETE FROM todo WHERE todo_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, todo_id);
			result += pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
