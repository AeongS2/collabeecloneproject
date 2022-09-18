package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DocumentPostDao {
	//문서작성 클릭  but, 아무것도 안쓰면 임시저장 안됨.  근데 이거는 에디터 쓰면 어케될지 몰겟음
	public void setDocument(int member_id, int workspace_id) {
		String sql = "INSERT INTO document (document_id, workspace_id, writer_id, edit_date, drafts) "
				+ "VALUES (DOCUMENT_ID.NEXTVAL, ?, ?, SYSDATE, 1)"; 
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);//프라이빗
			pstmt.setInt(2, workspace_id);
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
	}
}
