package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class WorkspaceAlarmDao {
	//협업공간 알림끄기 
	public void setWorkspace_Alarm(int onAlarm, int member_id, int workspace_id){
		String sql = "UPDATE workspace_mb SET workspace_alarm = ? where member_id = ? and workspace_id = ?";
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, onAlarm);//알람이 꺼짐0, 켜짐1
			pstmt.setInt(2, member_id);
			pstmt.setInt(3, workspace_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		DBConnection.pstmtClose(pstmt);
	}
	
}
