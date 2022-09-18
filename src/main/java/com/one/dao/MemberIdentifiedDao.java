package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberIdentifiedDao {
	public String MemberPwIdentified(int member_id) {
		String sql = "SELECT pw FROM member WHERE member_id = ?";
		Connection conn = DBConnection.getConnection();
		String pw="";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				pw = rs.getString("pw");	
			}
			DBConnection.getClose(pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return pw;
	}
}
