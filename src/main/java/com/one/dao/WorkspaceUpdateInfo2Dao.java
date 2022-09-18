package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class WorkspaceUpdateInfo2Dao {
	//대외비 설정(문서복제금지, 0(해제)/1(설정))
	public int setWorkspace_Confidential(int confidential, int workspace_id){
		String sql = "UPDATE workspace SET confidential = ? WHERE workspace_id = ?";
		int result = 0;
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, confidential); 
			pstmt.setInt(2, workspace_id);//현재공간id
			result = pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	} 
	
	//협업공간 완료  0(해제)/1(설정) 
	public int setWorkspace_Complete(int complete, int workspace_id){
		String sql = "UPDATE workspace SET complete = ? WHERE workspace_id = ?";
		int result = 0;
		try {	
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, complete);
			pstmt.setInt(2, workspace_id);//현재공간id
			result = pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
