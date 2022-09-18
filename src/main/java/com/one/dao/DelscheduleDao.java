package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DelscheduleDao {
	//일정 삭제
	void delSchedule(int schedule_id) {
		String sql = "DELETE FROM schedule WHERE schedule_id = ?";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, schedule_id);//선택한일정id
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
//				 (누르면 일정을 삭제하시겠습니까? 창뜸)
//		System.out.println("일정이 삭제되었습니다.");
	}
}
