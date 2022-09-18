package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BookmarkDelDao {
	public int BookmarkDel(int bookmark_id) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "DELETE FROM bookmark WHERE bookmark_id = ?";
		int result = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookmark_id);
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) { 
			e.printStackTrace();
		}
		
		return result;
	}
}
