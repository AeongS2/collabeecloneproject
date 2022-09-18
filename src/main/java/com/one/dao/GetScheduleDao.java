package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.one.dto.ScheduleDto;

public class GetScheduleDao {
	public ArrayList<ScheduleDto> getSchedule(int schedule_id) {
		ArrayList<ScheduleDto> list = new ArrayList<ScheduleDto>();
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT * FROM schedule WHERE schedule_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, schedule_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int writer_id = rs.getInt("writer_id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String start_date = rs.getString("start_date");
				String finish_date = rs.getString("finish_date");
				String locations = rs.getString("locations");
				
				ScheduleDto dto = new ScheduleDto(schedule_id, 0, writer_id, title, content, 0, start_date, finish_date, locations, "", "");
				list.add(dto);
			}
			DBConnection.getClose(pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Integer> getAttendeeList(int schedule_id) {
		Connection conn = DBConnection.getConnection();
		ArrayList<Integer> list = new ArrayList<Integer>();

		String sql = "SELECT member_id FROM schedule_attendee WHERE schedule_id = ? ORDER BY attendee_id";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, schedule_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("member_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
