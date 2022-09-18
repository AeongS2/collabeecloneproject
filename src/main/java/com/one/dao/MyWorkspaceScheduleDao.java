package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.one.dto.MyScheduleDto;

public class MyWorkspaceScheduleDao {
	//전체 캘린더
	//  공간id를 넣으면 그 공간의 배열 리턴
	//캘린더 일정 내용만 arrayList로 출력  	
	public ArrayList<MyScheduleDto> getCalender(int workspace_id) { //0(해제)/1(적용)
		ArrayList<MyScheduleDto> list = new ArrayList<MyScheduleDto>();
		String sql = "SELECT  schedule_id, to_char(start_date, '\"\"yy\"년 \"mm\"월 \"dd\"일\"') \"start_date\", to_char(finish_date, '\"\"yy\"년 \"mm\"월 \"dd\"일\"') \"finish_date\", title, writer_id " 
				+ "FROM (SELECT * FROM schedule WHERE workspace_id = ? ORDER BY start_date)";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);//일정출력할 공간id
			ResultSet rs = pstmt.executeQuery();
			for(int i = 0; i <= 1; i++) {
				if(rs.next()) {
					int schedule_id = rs.getInt("schedule_id");
					String start_date = rs.getString("start_date");
					String finish_date = rs.getString("finish_date");
					String title = rs.getString("title");
					int member_id = rs.getInt("writer_id");
					MyScheduleDto dto = new MyScheduleDto(workspace_id, schedule_id, member_id, title, start_date, finish_date);
					list.add(dto); // sql문 수정하기
				}
			}
			DBConnection.getClose(pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
