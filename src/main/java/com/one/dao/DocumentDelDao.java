package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DocumentDelDao {
	public void delDocument(int document_id) {
		//제약조건 확인
		String sql = "DELETE FROM document WHERE document_id = ?";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, document_id);
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}//선택한 문서
	} 
}
