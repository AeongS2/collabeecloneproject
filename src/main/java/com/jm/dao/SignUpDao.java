package com.jm.dao;

import java.sql.*;

public class SignUpDao {
	public void signUp(String email, String pw, int cert, String name) {
		Connection conn = DBConnection.getConnection();
		
		String sql = "INSERT INTO member(member_id, email, pw, certification, joindate, timezone, name) "
				+ "VALUES (member_id.nextval, ?, ?, ?, sysdate, 213, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			pstmt.setInt(3, cert);
			pstmt.setString(4, name);
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
