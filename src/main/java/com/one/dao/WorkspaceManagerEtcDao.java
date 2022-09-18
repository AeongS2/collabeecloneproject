package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class WorkspaceManagerEtcDao {
	//관리자 선정
	public void workspacePickManager(int fl, int workspace_id, int member_id) {
		String sql = "UPDATE workspace_mb SET manager_id=?, manager_icon_id=? WHERE workspace_id = ? AND member_id = ?";
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fl);
			pstmt.setInt(2, fl);
			pstmt.setInt(3, workspace_id);//리턴받은거
			pstmt.setInt(4, member_id);//관리자된id
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//멤버 탈퇴
	public void workspaceDelMember(int workspace_id, int member_id) {
		String sql = "DELETE FROM workspace_mb WHERE workspace_id = ? AND member_id = ?";
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);//리턴받은거
			pstmt.setInt(2, member_id);//탈퇴시킬id
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
