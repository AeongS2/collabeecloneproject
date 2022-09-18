package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ScheduleUpdateDao {
	//일정 update
	public void updateSchedule(int schedule_id, ArrayList<String> list) {
		String sql = "UPDATE schedule" 
				+ " SET title=?, content=?, start_date=?, finish_date=?, locations=?, edit_date=SYSDATE" 
				+ " WHERE schedule_id = ?";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			for(int i = 0; i <= list.size()-1; i++) {
				System.out.println("update : "+list.get(i));
				pstmt.setString(i+1, list.get(i));
				/*
				 * pstmt.setString(2, "content"); pstmt.setString(3, "start_date");
				 * pstmt.setString(4, "finish_Date"); pstmt.setString(5, "locations");
				 */
			}
			pstmt.setInt(6, schedule_id);
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//참석자 update
	public void updateScheduleAttnedee(int schedule_id, String attendee) {
		Connection conn = DBConnection.getConnection();
		
		String sql1 = "DELETE FROM schedule_attendee WHERE schedule_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, schedule_id);
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String sql2 = "INSERT INTO schedule_attendee VALUES (attendee_id, ?, ?)";
		try {
			String[] list = attendee.split("_");
			for(int i = 0; i <= list.length-1; i++) {
				PreparedStatement pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, schedule_id);
				pstmt.setInt(2, Integer.parseInt(list[i]));
				pstmt.executeUpdate();
				DBConnection.pstmtClose(pstmt);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
