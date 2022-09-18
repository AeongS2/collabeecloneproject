package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DocumentSaveDao {
	//문서 저장 클릭시
	public void saveDocument(String title, String content, int document_id, int workspace_id){
		//임시저장 바꾸기
		try {
			Connection conn = DBConnection.getConnection();
			String sql = "UPDATE document SET drafts = 0, title = ?, content = ?, workspace_id = ? WHERE document_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setInt(3, workspace_id);
			pstmt.setInt(4, document_id);
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//문서 고정멘트 댓글
	public void setFixed_Comment(int member_id, int document_id, String fixed_comment) {
		String sql = "INSERT INTO comments VALUES (201, ?, ?, SYSDATE, ?, NULL, 1, 0)";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);//로그인중id
			pstmt.setInt(2, document_id);//현재문서id
			pstmt.setString(3, fixed_comment);
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
