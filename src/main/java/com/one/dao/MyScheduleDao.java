package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.one.dto.MyScheduleDto;
import com.one.dto.ScheduleDateDto;

public class MyScheduleDao {
	
	//내일정만 보기   내가 작성자이거나 참석자  나의 일정 공간별로 보기
	ArrayList<MyScheduleDto> showMySchedule(MyScheduleDto dto) {
		String sql = "SELECT to_char(start_date, 'AM fmhh:mi') \"start_date\", title " + 
				"FROM schedule WHERE workspace_id = ? AND (writer_id = ? OR substr(attendee, 1, length(?)+1) = ?||'_' " + 
				"OR instr(attendee, '_'|| ? ||'_', 1) > 0) ORDER BY start_date";
				ArrayList<MyScheduleDto> list = new ArrayList<MyScheduleDto>();
		try {
//			if(fl == 0) {
//				return getCalender(workspace_id,1);
//			}
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dto.getWorkspace_id()); //선택한 공간id
			for(int i = 2; i <= 5; i++) {
				pstmt.setInt(i, dto.getMember_id()); //로그인한 id
			}
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int schedule_id = rs.getInt("schedule_id");
				String start_date = rs.getString("start_date");
				String finish_date = rs.getString("finish_date");
				String title = rs.getString("title");//스케줄아이디
				MyScheduleDto sdto = new MyScheduleDto(dto.getWorkspace_id(), schedule_id, dto.getMember_id(), title, start_date, finish_date);
				list.add(sdto);
			}
			DBConnection.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//시작일 ~ 종료일 필터 적용
		public ArrayList<MyScheduleDto> showSchedule_Date(ScheduleDateDto sdto, int workspace_id, int member_id) {
			String sql = "SELECT to_char(start_date, 'AM fmhh:mi') \"start_date\", title FROM schedule " + 
					"WHERE start_date BETWEEN ? AND ? AND workspace_id = ? ORDER BY start_date";
			ArrayList<MyScheduleDto> list = new ArrayList<MyScheduleDto>();
			try {
//				MyWorkspaceScheduleDao dao = new MyWorkspaceScheduleDao();
//				if(fl == 0) { //필터 해제   전체 기간 일정 출력
//					return dao.getCalender(dtow.getWorkspaceId(), 1); //그냥 getCalendar를 실행해주면 될듯!!
//				}
				Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);//왜 오류?
				pstmt.setString(1, sdto.getStart_date());
				pstmt.setString(2, sdto.getFinish_date());
				pstmt.setInt(3, workspace_id); //선택한 공간id
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int schedule_id = rs.getInt("schedule_id");
					String start_date = rs.getString("start_date");
					String finish_date = rs.getString("finish_date");//맞는지 확인..
					String title = rs.getString("title");
					MyScheduleDto dto = new MyScheduleDto(workspace_id, schedule_id, member_id, title, start_date, finish_date);
					list.add(dto);
				}
				DBConnection.getConnection();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
		//전체 캘린더
		//  공간id를 넣으면 그 공간의 일정을 담은 배열 리턴
		//캘린더 일정 내용만 arrayList로 출력  	
		ArrayList<MyScheduleDto> getCalender(int workspace_id, int member_id) { //0(해제)/1(적용)
			ArrayList<MyScheduleDto> list = new ArrayList<MyScheduleDto>();
			String sql = "SELECT to_char(start_date, '\"\"yy\"년 \"mm\"월 \"dd\"일\"') \"start_date\", title "
					+ "FROM (SELECT * FROM schedule WHERE workspace_id = ? ORDER BY start_date)";
			try {
//				if(fl == 0) {
//					return null;
//				}
				System.out.println("getCalendar 들어옴");
				Connection conn = DBConnection.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, workspace_id);//일정 출력할 공간id
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					int schedule_id = rs.getInt("schedule_id");
					String start_date = rs.getString("start_date");
					String finish_date = rs.getString("finish_date");
					String title = rs.getString("title");
					
					MyScheduleDto dto = new MyScheduleDto(workspace_id, schedule_id, member_id, title, start_date, finish_date);
					list.add(dto);
				}
				System.out.println(list);
				DBConnection.getClose(pstmt, rs);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
		//필터 둘다 씌우면
		/*ArrayList<MyScheduleDto> showSchedule(ScheduleDateDto sdto, int workspace_id, Member_Dto mdto) {
			ArrayList<MyScheduleDto> list = showMySchedule(workspace_id, mdto.getMember_id());
			ArrayList<MyScheduleDto> list2 = showSchedule_Date(sdto.getStart_date(), sdto.getFinish_date(),workspace_id);
			list.retainAll(list2);//교집합 구함
			return list;*/
//			System.out.println(list);
		}
//}
