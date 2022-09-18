package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class DraftsDocumentDelDao {
	//임시저장 문서 삭제 새문서로 안감
	public boolean delDrafts(int document_id) throws Exception {
		int result=0;
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "DELETE FROM document WHERE document_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, document_id); //선택한 문서id
			result = pstmt.executeUpdate();
			pstmt.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result==1;
	}
}
