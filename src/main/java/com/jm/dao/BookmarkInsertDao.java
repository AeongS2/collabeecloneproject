package com.jm.dao;

import java.sql.*;

public class BookmarkInsertDao {
	// 북마크 추가
	public void bookmarkInsert(int member_id, int document_id) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "INSERT INTO bookmark values (bookmark_id.nextval , ?, ?, sysdate)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			pstmt.setInt(2, document_id);
			pstmt.executeUpdate();
		
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
}
