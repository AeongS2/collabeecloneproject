package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ScheduleSaveDao {
	//일정저장(클릭)
	public void setSchedule(int workspace_id, int writer_id, String title, String content, String locations, String start_date, String finish_date) {
		String sql = "INSERT INTO schedule (schedule_id, workspace_id, writer_id, title, content, locations, start_date, finish_date)VALUES (schedule_id.nextval, ?, ?, ?, ?, ?, ?, ?)"; 
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);
			pstmt.setInt(2, writer_id);//작성자id
			pstmt.setString(3, title);
			pstmt.setString(4, content);
			pstmt.setString(5, locations);
			pstmt.setString(6, start_date);
			pstmt.setString(7, finish_date);
			pstmt.executeUpdate();//변경된 행의 수
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}//일정 drafts, reader, attendee 없앰
	}
}
