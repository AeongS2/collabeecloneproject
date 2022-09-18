package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ScheduleDelDao {
	//일정 삭제
	public void delSchedule(int schedule_id) {
		String sql = "DELETE FROM schedule WHERE schedule_id = ?";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, schedule_id);//선택한일정id
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
