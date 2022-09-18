package com.jm.dao;

import java.sql.*;

public class LoginAccountCheckDao {
	public int LoginAccountCheck(String email, String pw) {
		
		Connection conn = DBConnection.getConnection();
		
		int login_cnt = -1;
		String sql = "SELECT count(*) FROM member WHERE email = ? AND pw = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pw);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				login_cnt = rs.getInt("count(*)");
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return login_cnt;
		
	}
}
