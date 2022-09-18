package com.jm.dao;

import java.sql.*;

import com.jm.dto.*;

public class LoginDao {
	
	// 로그인 체크 로그인완료 true 아니면 false
	public boolean loginCheck(MemberDto member) {
		
		Connection conn = DBConnection.getConnection();
		
		int login_cnt = -1;
		String sql = "SELECT count(*) FROM member WHERE email = ? AND pw = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPw());
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				login_cnt = rs.getInt("count(*)");
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(login_cnt == 1) {
			return true;
		} else {
			return false;
		}
		

		
	}
}
