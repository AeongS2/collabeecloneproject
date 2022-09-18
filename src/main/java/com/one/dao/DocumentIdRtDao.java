package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DocumentIdRtDao {
	//방금 만든 문서id 리턴   0(발행된문서)/1(임시저장문서)
	public int getDocument_id(int workspace_id, int member_id) {
		String sql = "SELECT max(document_id) \"document_id\" FROM document WHERE writer_id = ? AND workspace_id = ? AND drafts = 1";
		int document_id = 0;
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id); //로그인한 id
			pstmt.setInt(2, workspace_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				document_id = rs.getInt("document_id");
			}
			DBConnection.getClose(pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return document_id;
	}
}
