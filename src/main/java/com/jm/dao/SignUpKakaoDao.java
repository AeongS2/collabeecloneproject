package com.jm.dao;

import java.sql.*;

public class SignUpKakaoDao {
	public int SignUpKakao(String kakao_id, String name, String picture) {		
		Connection conn = DBConnection.getConnection();
		
		String sql = "INSERT INTO member(member_id, email, joindate, name, picture) "
				+ "VALUES (member_id.nextval, ?, sysdate, ?, ?)";
		int result = -1;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kakao_id);
			pstmt.setString(2, name);
			pstmt.setString(3, picture);
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
