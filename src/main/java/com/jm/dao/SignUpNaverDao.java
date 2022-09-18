package com.jm.dao;

import java.sql.*;

public class SignUpNaverDao {
	public void SignUpNaver(String email, String name) {
		
		Connection conn = DBConnection.getConnection();
System.out.println(email);		
		String sql = "INSERT INTO member(member_id, email, name, pw, joindate) VALUES (member_id.nextval, ? , ?, 'naver', sysdate)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
