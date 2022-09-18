package com.jm.dao;

import java.sql.*;

public class ResetPW1Dao {
	public int ResetPW1(String n_pw, String email) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "UPDATE member SET pw = ? WHERE email= ?";
		int result = -1;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, n_pw);
			pstmt.setString(2, email);
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
