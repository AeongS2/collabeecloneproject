package com.yr.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

import com.yr.dto.*;
public class OptionDao {
	//프사바꾸기
	public void setPicture(String fileName, int member_id) {
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "update member set picture = ? where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fileName);
			pstmt.setInt(2, member_id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 이름바꾸기
	public void setName(String name, int member_id) {
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "update member set name = ? where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, member_id);
			//System.out.println("do it");
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	//이름보여주기
	public String showName(int member_id) {
		Connection conn = DBConnection.getConnection();
		String name = "";
		try{
			String sql = "select name from member where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return name;
	}
	//폰번바꾸기
	public void setPhonenum(String p, int member_id) {
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "update member set phonenum = ? where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, p);
			pstmt.setInt(2, member_id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 폰번보여주기
	public String showPhoneNum(int member_id) {
		Connection conn = DBConnection.getConnection();
		String p = "";
		try{
			String sql = "select phonenum from member where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				p = rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	//부서명 바꾸기
	public void setDepartment(String team, int member_id) {
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "update member set department = ? where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, team);
			pstmt.setInt(2, member_id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	//부서명 보여주기
	public String showTeam(int member_id) {
		Connection conn = DBConnection.getConnection();
		String team = "";
		try{
			String sql = "select department from member where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				team = rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return team;
	}
	// 주요업무 바꾸기
	public void setTask(String job, int member_id) {
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "update member set task = ? where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, job);
			pstmt.setInt(2, member_id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println("finish");
	}
	// 주요업무 보여주기
	public String showTask(int member_id) {
		Connection conn = DBConnection.getConnection();
		String task = "";
		try{
			String sql = "select task from member where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				task = rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return task;
	}
	// 타임존리스트
	public ArrayList<TimezoneDto> getTimezoneList() throws Exception {
		ArrayList<TimezoneDto> list1 = new ArrayList<TimezoneDto>();
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT timezone_id, capital_name, time FROM timezone";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int timezone_id = rs.getInt(1);
			String capital_name = rs.getString(2);
			String time = rs.getString(3);
			TimezoneDto dto = new TimezoneDto(timezone_id, capital_name, time);
			list1.add(dto);
		}
		return list1;
	}
	// 비번뽑기
	public String showPw(int member_id) {
		Connection conn = DBConnection.getConnection();
		String Pw = "";
		try{
			String sql = "select pw from member where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				Pw = rs.getString(1);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return Pw;
	}
	//비밀번호 변경
	public void setPw(String pw, int member_id) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "update member set pw = ? where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setInt(2, member_id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	/*public void setPw(String ppw, int member_id, String npw) throws SQLException, ClassNotFoundException {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pwCheck = "";
		try{
			String sql = "select pw from member where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pwCheck = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
			rs.close();
		}
		if(ppw.equals(pwCheck)) {
			PreparedStatement pstmt2 = null;
			try {
				String sql2 = "update member set pw = ? where member_id = ?";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setString(1, npw);
				pstmt2.setInt(2, member_id);
				pstmt2.executeUpdate();
				System.out.println("비밀번호변경이 완료되었습니다.");
			}catch(Exception e) {
				e.printStackTrace();
			}
			finally {
				pstmt2.close();
			}
		} else {
			System.out.println("비밀번호변경에 실패했습니다.");
		}
	}*/
	//회원탈퇴
	public void setMemberOut(int member_id) {
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "delete from member where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	//인증번호 받기
	/*public int setCertification(MemberDto member) {
		Connection conn = DBConnection.getConnection();
		Random rd = new Random();
		int certification = rd.nextInt(10000);
		try{
			String sql = "update member set certification = ? where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getCertification());
			pstmt.setInt(2, member.getMember_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return certification;
	}	
	// 타임존바꾸기
	public void setTimezone(String capital_name, int member_id) throws SQLException, ClassNotFoundException {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		String time = "";
		try {
			String sql = "update member set timezone ="
					+ " (select timezone_id from timezone where capital_name = ?) "
					+ "where member_id = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, capital_name);
			pstmt.setInt(2, member_id);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt.close();
		}
		ResultSet rs = null;
		PreparedStatement pstmt2 = null;
		try{
			String sql2 = "select time from timezone where capital_name = ?";
			pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setString(1, capital_name);
			rs = pstmt2.executeQuery();
			if(rs.next()) {
				time = rs.getString("time");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt2.close();
			rs.close();
		}
		PreparedStatement pstmt3 = null;
		try {
			String sql3 = "alter session set time_zone = '" + time + "'";
			// current_date가 바뀌는 것
			pstmt3 = conn.prepareStatement(sql3);
			pstmt3.execute();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pstmt3.close();
		}
	}
	// 방해금지모드on
	public void setAll_alarmOn(int clear_date, int member_id) throws SQLException {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "update member set "
					+ "clear_date = sysdate + ?/24, "
					+ "all_alarm = 1 where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			if(clear_date == 1) {
				pstmt.setInt(1, 1);
				pstmt.setInt(2, member_id);
				pstmt.executeUpdate();
				System.out.println("1시간 동안 콜라비 알림을 받을 수 없습니다. 활동 소식은 새로운 소식에서 확인할 수 있습니다.");
			} else if(clear_date == 2) {
				pstmt.setInt(1, 2);
				pstmt.setInt(2, member_id);
				pstmt.executeUpdate();
				System.out.println("2시간 동안 콜라비 알림을 받을 수 없습니다. 활동 소식은 새로운 소식에서 확인할 수 있습니다.");
			} else if(clear_date == 4) {
				pstmt.setInt(1, 4);
				pstmt.setInt(2, member_id);
				pstmt.executeUpdate();
				System.out.println("4시간 동안 콜라비 알림을 받을 수 없습니다. 활동 소식은 새로운 소식에서 확인할 수 있습니다.");
			} else{
				String sql2 = "update member set "
					+ "clear_date = trunc(sysdate+1, 'DD') + 9/24,"
					+ " all_alarm = 1 where member_id = ?";
				pstmt2 = conn.prepareStatement(sql2);
				pstmt2.setInt(1, member_id);
				pstmt2.executeUpdate();
				pstmt2.close();
				System.out.println("오전 9시까지 콜라비 알림을 받을 수 없습니다. 활동 소식은 새로운 소식에서 확인할 수 있습니다.");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			pstmt.close();
		}
	}
	// 방해금지모드 off
	public void setAll_alarmOff(MemberDto member) {
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "update member set all_alarm = 0, clear_date = null where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getMember_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	//요일알람
	public void setWeek_alarm(MemberDto member) {
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "update member set mon = ?, tue = ?, wed = ?, thu = ?, "
					+ "fri = ?, sat = ?, sun = ? where member_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getMon());
			pstmt.setInt(2, member.getTue());
			pstmt.setInt(3, member.getWed());
			pstmt.setInt(4, member.getThu());
			pstmt.setInt(5, member.getFri());
			pstmt.setInt(6, member.getSat());
			pstmt.setInt(7, member.getSun());
			pstmt.setInt(8, member.getMember_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 시간대알람
	public void setTime_alarm(int all_day, int member_id, int start_time, int end_time) throws SQLException, ClassNotFoundException {
		PreparedStatement pstmt = null;
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "update member set all_day = ? where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			if(all_day == 0) {
				pstmt.setInt(1, 0);
				pstmt.setInt(2, member_id);
				PreparedStatement pstmt2 = null;
				try{
					String sql2 = "update member set start_time = ?, end_time = ? where member_id = ?";
					pstmt2 = conn.prepareStatement(sql2);
					pstmt2.setInt(1, start_time);
					pstmt2.setInt(2, end_time);
					pstmt2.setInt(3, member_id);
					pstmt2.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}
				finally {
					pstmt2.close();
				}
			} else{
				pstmt.setInt(1, 1);
				pstmt.setInt(2, member_id);
				PreparedStatement pstmt3 = null;
				try{
					String sql3 = "update member set start_time = 17, end_time = 39 where member_id = ?";
					pstmt3 = conn.prepareStatement(sql3);
					pstmt3.setInt(1, member_id);
					pstmt3.executeUpdate();
				}catch(Exception e) {
					e.printStackTrace();
				}
				finally {
					pstmt3.close();
				}
			}
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			pstmt.close();
		}
	}	
	// 메일알람 끄기
	public void setMail_alarm(int mail_alarm, int member_id) throws SQLException {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "update member set mail_alarm = ? where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			if(mail_alarm == 0) {
				pstmt.setInt(1, 0);
				pstmt.setInt(2, member_id);
				pstmt.executeUpdate();
				System.out.println("지금부터 메일 알림이 발송되지 않습니다.");
			}
			else{
				pstmt.setInt(1, 1);
				pstmt.setInt(2, member_id);
				pstmt.executeUpdate();
				System.out.println("지금부터 활동 소식을 가입한 계정의 메일로 받아보실 수 있습니다.");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			pstmt.close();
		}
	}
	// 협업공간 알림 끄기
	public void setWorkspace_alarm(int workspace_alarm, int member_id, int workspace_id) throws SQLException {
		PreparedStatement pstmt = null;
		Connection conn = DBConnection.getConnection();
		try {
			String sql = "update workspace_mb set workspace_alarm = ? "
					+ "where member_id = ? and workspace_id = ?";
			pstmt = conn.prepareStatement(sql);
			if(workspace_alarm == 0) {
				pstmt.setInt(1, 0);
				pstmt.setInt(2, member_id);
				pstmt.setInt(3, workspace_id);
				pstmt.executeUpdate();
				System.out.println("프로젝트 협업공간의 알림이 꺼졌습니다.");
			}
			else{
				pstmt.setInt(1, 1);
				pstmt.setInt(2, member_id);
				pstmt.setInt(3, workspace_id);
				pstmt.executeUpdate();
				System.out.println("프로젝트 협업공간의 알림이 켜졌습니다. 이제부터 모든 알림을 받으실 수 있습니다.");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			pstmt.close();
		}
	}
	// 문서알림끄기
	public void setDocument_alarmOff(DocumentAlarmDto documentAlarm) {
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "insert into document_alarm values(document_alarm_id.nextval ,? ,?)";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, documentAlarm.getMember_id());
			pstmt.setInt(2, documentAlarm.getDocument_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	// 문서알림다시키기
	public void setDocument_alarmOn(DocumentAlarmDto documentAlarm) {
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "delete from document_alarm where member_id = ? and document_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, documentAlarm.getMember_id());
			pstmt.setInt(2, documentAlarm.getDocument_id());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}*/
	
	
}
