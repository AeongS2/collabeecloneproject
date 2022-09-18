package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import collabee.jh.dto.JHDto;
import collabee.jh.dao.myWorkspaceScheduleDao;

public class ScheduleDateFilterDao {
	//시작일 ~ 종료일 필터  0(해제)/1(적용)
	ArrayList<JHDto> showSchedule_Date(String start, String finish, int workspace_id, int fl) {
		String sql = "SELECT to_char(start_date, 'AM fmhh:mi') \"start_date\", title FROM schedule " + 
				"WHERE start_date BETWEEN ? AND ? AND workspace_id = ? ORDER BY start_date";
		ArrayList<JHDto> list = new ArrayList<JHDto>();
		try {
			/*
			 * if(fl == 0) { //필터 해제 return myWorkspaceScheduleDao.getCalender(workspace_id,
			 * 1); }
			 */
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);//왜 오류?
			pstmt.setString(1, start);
			pstmt.setString(2, finish);
			pstmt.setInt(3, workspace_id); //선택한 공간id
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String start_date = rs.getString("start_date");
				String finish_date = rs.getString("finish_date");//맞는지 확인..
				String title = rs.getString("title");
				JHDto dto = new JHDto(start_date, finish_date, title);
				list.add(dto);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
