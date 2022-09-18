package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class WorkspaceUpdateInfoDao {
	//협업공간 이름 수정
	public void setWorkspace_Name(int workspace_id, String input_name) {
		String sql = "UPDATE workspace SET workspace_name = ? Where workspace_id = ?";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, input_name); //스캐너로 입력받음
			pstmt.setInt(2, workspace_id); //현재공간
			pstmt.executeUpdate();//멤버 로그인중id고 뉴스는 모든 멤에게
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} 

	
	//협업공간 설명 수정 
	public void setWorkspace_Summary(String input_summary, int workspace_id){
		String sql = "UPDATE workspace SET summary = ? WHERE length(?) <= 100 AND workspace_id = ?";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, input_summary);
			pstmt.setString(2, input_summary);
			pstmt.setInt(3, workspace_id);
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} 
}
