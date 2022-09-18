package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

public class WorkspaceInviteMemberDao {
	//협업공간에 기존 파트너 초대   여러명을 초대할수 있어서 
	public void partner_invite(int workspace_id, int member_id) {
		String sql = "INSERT INTO workspace_mb (workspace_mb_id, workspace_id, member_id) VALUES (workspace_mb_id.nextval, ?, ?)";
		Connection conn = DBConnection.getConnection();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);
			pstmt.setInt(2, member_id);
			pstmt.executeUpdate(); //행수 = 명수
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	} 
}
