package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class SignUpCheckEmailDao {
	
	// 가입된 이메일 인지 확인
	public int checkEmail(String input_email) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT count(*) a FROM member WHERE email = ?";
		int result = -1;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, input_email);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("a");
			}
			
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(result);
		return result;
	}
	
}
