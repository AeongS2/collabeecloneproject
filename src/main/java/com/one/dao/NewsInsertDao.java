package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class NewsInsertDao { //이거 변경사항 언니한테 물어보기
	//소식 보내기 -> 공간멤에게 전부? member는 누구까지인지
	public static void setNews(int member_id, String content) {
		String sql = "INSERT INTO news VALUES (news_id.nextval, ?, ?, SYSDATE)";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);//소식받을멤버id
			pstmt.setString(2, content);//내용
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
