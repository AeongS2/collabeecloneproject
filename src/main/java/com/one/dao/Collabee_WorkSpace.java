package com.one.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Scanner;
import java.util.StringTokenizer;





class Dbc {
	
	Connection conn = null;
	int member_id = 2;//로그인한id
	int workspace_id = 8; //현재 있는 협업공간id
	int document_id = 4; //지금 보고있는 문서id
	int schedule_id = 1;//지금 보고있는 일정id
	int corporation_id = 5; //로그인한id의 회사id
	ArrayList<Integer> MyWorkspace;//내가 속한 협업공간 리스트
//	ArrayList<String> MyColleague;//나의 회사 동료
	
	
	Dbc(){}
	Dbc(int member_id) {
		this.member_id = member_id;
		String sql = "SELECT corporation_id FROM member WHERE member_id = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			this.corporation_id = rs.getInt("corporation_id");
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	//오라클 접속
	void getConnection() { 
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@192.168.1.7:1521:xe";
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "oraclePort";
		String pw = "369369";
		try {
			Class.forName(driver);
			this.conn = DriverManager.getConnection(url, user, pw);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		} 
		System.out.println("정상접속");
	}
	

class Workspace extends Dbc{
//	Document d = new Document();
	Workspace() {}
	Workspace(int workspace_id) {//현재 보고있는 공간id
		this.workspace_id = workspace_id;
	}
	
	//나의 협업공간 목록
	ArrayList<Integer> getMyWorkspace_List() {
		String sql = "SELECT w.workspace_id FROM workspace w, workspace_mb m " 
				+ "WHERE w.workspace_id = m.workspace_id AND m.member_id = ? ORDER BY w.creation_date";
		ArrayList<Integer> list = new ArrayList<Integer>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("workspace_id"));
			}
			this.MyWorkspace = list;
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list; 
	}
	
	
	//협업공간 이름, 설명
	void getWorkspace_Title() throws Exception {
		String sql = "SELECT workspace_name, summary FROM workspace WHERE workspace_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, workspace_id); //보고있는 공간
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			String workspace_name = rs.getString("workspace_name");
			String summary = rs.getString("summary");
			System.out.println(workspace_name + "\n" + summary);
		}
		rs.close();
		pstmt.close();
	} 
	
	
	//회사동료
	void getColleague() throws Exception{
		String sql = "SELECT picture, name FROM member WHERE corporation_id = ? AND member_id <> ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, corporation_id);
		pstmt.setInt(2, member_id);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			String picture = rs.getString("picture");
			String name = rs.getString("name");
			System.out.println(picture + name);
		}
		rs.close();
		pstmt.close();
	}


	//외부협업자
	void getExtraPartner() {
		String sql =  "SELECT email, name, picture FROM member WHERE member_id IN (SELECT my_partner FROM partner WHERE member_id = ? AND hide_partner = 'N') "
				+ "AND corporation_id <> ? OR corporation_id IS NULL";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			pstmt.setInt(2, corporation_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String email = rs.getString("email");
				String picture = rs.getString("picture");
				String name = rs.getString("name"); 
				System.out.println(picture + "\t" + name + "\t" + email);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//현재공간에 속한 멤버 리스트
	void getWorkspace_MemberList() {
		String sql = "WITH MEMBER_LIST AS "
				+ "(SELECT m.picture, m.name, m.email, i.manager_icon_p FROM member m, workspace_mb w, manager_icon i "
				+ "WHERE m.member_id = w.member_id AND i.manager_icon_id = w.manager_icon_id AND w.workspace_id = ? AND m.member_id <> ?)"
				+ "SELECT * FROM member_list"; 
		try {
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  workspace_id);//지금공간id
			pstmt.setInt(2, member_id);//로그인중id
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String picture = rs.getString("picture");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String manager_icon_p = rs.getString("manager_icon_p");
				System.out.println(picture + "\t" + name + "\t" + email + "\t" + manager_icon_p);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}	
	
	//협업공간 생성
	void setWorkspace(String workspace_name, String color, String summary, String invite_url) throws Exception {
		//협업공간 생성
		String sql1 = "INSERT INTO workspace (workspace_id, workspace_name, color, summary, invite_url) VALUES (122, ?, ?, ?, ?)";
		PreparedStatement pstmt1 = conn.prepareStatement(sql1);
		pstmt1.setString(1, workspace_name);//입력받은것
		pstmt1.setString(2, color);
		pstmt1.setString(3, summary);
		pstmt1.setString(4, invite_url);
		pstmt1.executeUpdate();
		pstmt1.close();
		
		//최근접속한 공간 추가
		String sql2 = "SELECT workspace_id FROM workspace WHERE invite_url = ?"; //지금 있는 공간의 id 알아올수있음
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setString(1, invite_url);
		ResultSet rs = pstmt2.executeQuery();
		int workspace_id = 0;
		if(rs.next()) {
			workspace_id = rs.getInt("workspace_id");
		}
		rs.close();
		pstmt2.close();
		
	    String sql3 = "INSERT INTO recent_connection_workspace VALUES (?, 122, ?, SYSDATE)";
		PreparedStatement pstmt3 = conn.prepareStatement(sql3);
		pstmt3.setInt(1, member_id); //로그인한id
		pstmt3.setInt(2, workspace_id);//현재공간id
		pstmt3.executeUpdate();
		pstmt3.close();
		
		//협업공간 멤버 및 관리자 추가
		String sql4 = "INSERT INTO workspace_mb (workspace_mb_id, workspace_id, member_id, manager_id, manager_icon_id) VALUES (122, ?, ?, 1, 1)";
		PreparedStatement pstmt4 = conn.prepareStatement(sql4);
		pstmt4.setInt(1, workspace_id);//리턴받은거
		pstmt4.setInt(2, member_id);//로그인한id
		pstmt4.executeUpdate();
		pstmt4.close();
		System.out.println(workspace_name + "협업공간이 생성되었습니다.");
	}
	
	
	//협업공간에 기존 파트너 초대   여러명을 초대할수 있어서 
	void partner_invite(ArrayList<Integer> list) throws Exception {
		String sql = "INSERT INTO workspace_mb (workspace_mb_id, workspace_id, member_id) VALUES (workspace_mb_id.nextval, ?, ?)";
		for(int i = 0; i < list.size(); i++) {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);//현재공간id
			pstmt.setInt(2, list.get(i));
			pstmt.executeUpdate(); //행수 = 명수
			pstmt.close();
		}
	} 
	
	//기존 파트너 아닌 콜라비 회원 초대
	//협업공간에 새로운 파트너 초대(메일초대)
	void newPartner_Invite(String invite_mail) throws Exception {
		String sql = "INSERT INTO partner (partner_id, member_id, invite_mail, workspace_id) VALUES (partner_id.nextval, ?, ?, ?)"; 
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);//로그인한id
			pstmt.setString(2, invite_mail);//입력받음
			pstmt.setInt(3, workspace_id); //현재공간의id
			int cnt = pstmt.executeUpdate();
			pstmt.close();
			System.out.println(cnt + "명을 협업공간 멤버로 초대했습니다.");
	}
	
	//초대 수락
	void acceptance(String my_partner_email, String invite_mail) throws Exception {
		String sql = "UPDATE partner SET my_partner = (SELECT member_id FROM member WHERE email = ?), invite_mail = NULL, agree = 'Y' WHERE invite_mail = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, invite_mail);
		pstmt.setString(2, invite_mail); //수락한 사람 이메일 받아와야함
		pstmt.executeUpdate();
		pstmt.close();
	}
	
	//초대거절
	void refusal(String invite_mail) throws Exception {
		String sql = "DELETE FROM partner WHERE invite_mail = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, invite_mail); //초대한 메일
		pstmt.executeUpdate();
		pstmt.close();
	}
	
	//내 파트너 아이디 목록  
	ArrayList<Integer> getPartner_id() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		String sql = "SELECT member_id FROM member WHERE (corporation_id = ? AND member_id <> ?) "
				+ "OR (member_id IN (SELECT my_partner FROM partner WHERE member_id = ? AND hide_partner = 'N') AND corporation_id <> ? OR corporation_id IS NULL)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, corporation_id);//로그인한사람의 회사id
			pstmt.setInt(2, member_id); //로그인한id
			pstmt.setInt(3, member_id);//로그인한id
			pstmt.setInt(4, corporation_id);//로그인한사람 회사id
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getInt("member_id"));
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//초대링크 보여주기
	void getWorkspace_url() throws Exception {
		String sql = "select invite_url from workspace where workspace_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, workspace_id);//현재공간id
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) { 
			String invite_url = rs.getString("invite_url");
			System.out.println(invite_url);
		}
		rs.close();
		pstmt.close();
	}
	
	//협업공간 이름 리턴
	String rtWorkspace_Name(int workspace_id) {
		String sql = "SELECT workspace_name FROM workspace WHERE workspace_id = ?";
		String workspace_name = ""; 
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);//현재공간id
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				workspace_name = rs.getString("workspace_name");
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return workspace_name;
	}
		
		//협업공간 이름 수정
	void setWorkspace_Name(String input_name) throws Exception {
		String workspace_name = rtWorkspace_Name(workspace_id);//수정전 이름 출력, 업데이트 전에 저장
		String sql = "UPDATE workspace SET workspace_name = ? Where workspace_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, input_name); //스캐너로 입력받음
		pstmt.setInt(2, workspace_id); //현재공간
		setNews(member_id, workspace_name + " 협업공간이 " + input_name + " 협업공간으로 이름이 변경되었습니다.");
		pstmt.executeUpdate();//멤버 로그인중id고 뉴스는 모든 멤에게
		pstmt.close();
	} 
	
	
	//협업공간 설명 수정 
	void setWorkspace_Summary(String summary) throws Exception {
		String sql = "UPDATE workspace SET summary = ? WHERE length(?) <= 100 AND workspace_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, summary);
		pstmt.setString(2, summary);
		pstmt.setInt(3, 101);
		pstmt.executeUpdate();
		pstmt.close();
	} 
	
	//대외비 설정(문서복제금지, 0(해제)/1(설정))
	void setWorkspace_Confidential(int confidential) throws Exception {
		String sql = "UPDATE workspace SET confidential = ? WHERE workspace_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, confidential); 
		pstmt.setInt(2, workspace_id);//현재공간id
		pstmt.executeUpdate();
		pstmt.close();
		if(confidential == 1) {
			System.out.println("대외비 협업공간으로 변경되었습니다. \n협업공간 내 문서를 협업공간으로 복제할 수 없습니다.");
		} else {
			System.out.println(rtWorkspace_Name(workspace_id) + "협업공간이 일반 협업공간으로 설정되었습니다.");
		}
	} 
	
	//협업공간 완료  0(해제)/1(설정) 
	void setWorkspace_Complete(int complete) throws Exception {
		String sql = "UPDATE workspace SET complete = ? WHERE workspace_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, complete);
		pstmt.setInt(2, workspace_id);//현재공간id
		pstmt.executeUpdate();
		pstmt.close();
		System.out.println(rtWorkspace_Name(workspace_id) +" 협업공간이 " + (complete == 0? "진행 중으로 변경되었습니다." : "완료상태로 변경되었습니다. 이제부터 모든 멤버가 협업공간내 활동알림을 받을 수 없습니다."));
	}
	//팝업: www.collabee.co \n Test협업공간의 진행상태를 완료로 변경하시겠습니까? 변경하면 협업공간 활동알림을 모든 멤버가 받으실 수 없습니다.
	//www.collabee.co \n Test협업공간의 진행상태를 '진행 중'으로 변경하시겠습니까? 변경 시, 협업공간 내 활동알림을 모든 멤버가 받게 됩니다.
	
		//협업공간 알림끄기 
	void setWorkspace_Alarm(int complete) throws Exception {
		String sql = "UPDATE workspace_mb SET workspace_alarm = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		if(complete == 1) {//완료되면
			pstmt.setInt(1, 0);//알람이 꺼짐
		} else if(complete == 0){//완료 종료되면
			pstmt.setInt(1, 1);//알람이 켜짐
		}
		pstmt.executeUpdate();
		pstmt.close();
	}
	
	//협업공간 삭제(관리자 1명)  삭제기록 위해 삭제동의메서드 실행
	void delWorkspace_1() throws Exception {
		String sql = "DELETE FROM workspace WHERE workspace_id = ?";
		//제약조건 걸어놔서 관련 문서, 멤버, 일정, 할일, 의사결정 등 모두 없어지게함
		String workspace_name = rtWorkspace_Name(100);
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, 100);//현재공간id
		pstmt.executeUpdate();
		//소식 테이블에 전달   로그인중id
		setNews(member_id, workspace_name + " 협업공간이 삭제되었습니다. 이 협업공간에 공유된 모든 문서 및 컨텐츠가 모두 삭제되었습니다.");
		
	}
	
	
	//협업공간 삭제동의(관리자 여러명)
	void delWorkspace_Fl() throws Exception {
		String sql1 = "SELECT name FROM member WHERE member_id = ?";
		PreparedStatement pstmt1 = conn.prepareStatement(sql1);
		pstmt1.setInt(1, member_id);//로그인한id
		ResultSet rs = pstmt1.executeQuery();
		String name = "";
		if(rs.next()) {
			name = rs.getString("name");
		}
		rs.close();
		pstmt1.close();
		
		String sql2 = "INSERT INTO workspace_delete VALUES (workspace_del_id.nextval, ?, ?, ?, ?, 1, SYSDATE)"; 
		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
		pstmt2.setInt(1, 100);//삭제할 협업공간id
		pstmt2.setString(2, rtWorkspace_Name(100)); 
		pstmt2.setInt(3, member_id);//현재 로그인한 사람id
		pstmt2.setString(4, name);
		pstmt2.executeUpdate();
		pstmt2.close();
	}
	
	
	//협업공간 삭제(동의완료) 
	void delWorkspace_n() {
		String sql = "DELETE FROM workspace WHERE workspace_id = ? " + 
				"and (SELECT count(*) 관리자수 FROM workspace_mb WHERE workspace_id = ? AND manager_id = 1) "
				+ "= (SELECT count(*) 동의자수 FROM workspace_delete WHERE workspace_id = ? AND del_fl = 1)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			String workspace_name = rtWorkspace_Name(100);
			pstmt.setInt(1, workspace_id);//삭제하려는 공간
			pstmt.setInt(2, workspace_id);//삭제하려는 공간
			pstmt.setInt(3, workspace_id);//삭제하려는 공간
			pstmt.executeUpdate();
			pstmt.close();
			setNews(member_id, workspace_name + " 협업공간이 삭제되었습니다. 이 협업공간에 공유된 모든 문서 및 컨텐츠가 모두 삭제되었습니다.");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//관리자권한 설정
	void setWorkspace_Manager(int manager_id, int member_id) throws Exception {
		String sql = "UPDATE workspace_mb SET manager_id = ?, manager_icon_id = ? "
				+ "WHERE workspace_id = ? AND member_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, manager_id); //선택한 멤버
		if(manager_id == 1) {//관리자 선정
			pstmt.setInt(2, 1);//현재공간id
			setNews(member_id, rtWorkspace_Name(workspace_id) + " 협업공간의 관리자로 선정되었습니다.");
		} else if(manager_id == 0) {//관리자 해제
			pstmt.setInt(2, 0);
			setNews(member_id, rtWorkspace_Name(workspace_id) + " 협업공간의 관리자 권한이 해제되었습니다.");
		}
		pstmt.setInt(3, workspace_id);
		pstmt.setInt(4, member_id); //선택된 멤버
		pstmt.executeUpdate();
		pstmt.close();
	}
	
	//소식 보내기 -> 공간멤에게 전부? member는 누구까지인지
	void setNews(int member_id, String content) {
		String sql = "INSERT INTO news VALUES (news_id.nextval, ?, ?, SYSDATE)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);//소식받을멤버id
			pstmt.setString(2, content);//내용
			pstmt.executeUpdate();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
		//멤버탈퇴시킴  (공간탈퇴)
	void delWorkspace_Mb(int member_id) throws Exception {
		//협업공간 멤버에서 삭제
		String sql = "DELETE FROM workspace_mb WHERE workspace_id = ? AND member_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, workspace_id); //현재공간id
		pstmt.setInt(2, member_id); //탈퇴한 멤버id
		pstmt.executeUpdate();
		pstmt.close();
	}

	
	//참석자 변경 fl :(1(참석자 제거)/0(참석자 추가))
	ArrayList<String> setAttendee(int member_id, int fl) throws Exception {
		String sql1 = "SELECT attendee FROM schedule WHERE schedule_id = ?";
		PreparedStatement pstmt1 = conn.prepareStatement(sql1);
		pstmt1.setInt(1, schedule_id);//보고있는 일정
		ResultSet rs = pstmt1.executeQuery();
		ArrayList<String> list = new ArrayList<String>();
		while(rs.next()) {
			String attendee;
			if(rs.getString("attendee") == null) {
				attendee = "";
			} else {
				attendee = rs.getString("attendee"); 
			}
			switch(fl) {
			case 0 : //참석자 추가하기
				list.add(attendee + member_id + "_");
				break;
			case 1: //참석자 지우기
				if(attendee == "") {
					System.exit(0);
				}
					int index = attendee.indexOf("_" + member_id + "_");
					String subreader;
					if(index > 0) {
						subreader = attendee.substring(0, index + 1) + attendee.substring(index + 3);
						list.add(subreader);
					} 
					if(attendee.substring(0,2).equals(member_id+"_")) {
						subreader = attendee.substring(2);
						list.add(subreader);
					}
					break;
					}
		}
		rs.close();
		pstmt1.close();
		System.out.println(list);
		//변경사항 업데이트
		String sql2 = "UPDATE schedule SET attendee = ? WHERE schedule_id = ?";
		PreparedStatement pstmt2 = conn.prepareStatement(sql2); 
		for(int i = 0; i < list.size(); i++) {
			pstmt2.setString(1, list.get(i));
			pstmt2.setInt(2, schedule_id);
			pstmt2.executeUpdate();
		}
		pstmt2.close();
		return list;
	}	
	
	
	//읽은사람(0(추가)/1(제거))
	ArrayList<String> setReader(int member_id, int fl) throws Exception {
		String sql1 = "SELECT reader FROM schedule WHERE schedule_id = ?";
		PreparedStatement pstmt1 = conn.prepareStatement(sql1);
		pstmt1.setInt(1, schedule_id);//보고있는 일정
		ResultSet rs = pstmt1.executeQuery();
		ArrayList<String> list = new ArrayList<String>();
		while(rs.next()) {
			String reader;
			if(rs.getString("reader") == null) {
				reader = "";
			} else {
				reader = rs.getString("reader"); 
			}
			switch(fl) {
			case 0 : //읽은사람 추가하기
				list.add(reader + member_id + "_");
				break;
			case 1: //읽은사람 지우기(탈퇴 등)
				if(reader == "") {
					System.exit(0);
				}
					int index = reader.indexOf("_" + member_id + "_");
					String subreader;
					if(index > 0) {
						subreader = reader.substring(0, index + 1) + reader.substring(index + 3);
						list.add(subreader);
					} 
					if(reader.substring(0,2).equals(member_id + "_")) {
						subreader = reader.substring(2);
						list.add(subreader);
					}
					break;
			}
		}	
		rs.close();
		pstmt1.close();

		//변경사항 업데이트
		String sql2 = "UPDATE schedule SET reader = ? WHERE schedule_id = ?";
		PreparedStatement pstmt2 = conn.prepareStatement(sql2); 
		for(int i = 0; i < list.size(); i++) {
			pstmt2.setString(1, list.get(i));
			pstmt2.setInt(2, schedule_id);
			pstmt2.executeUpdate();
		}
		pstmt2.close();
		return list;
	}	
	
	//할일에서 담당자 삭제
	void delTodo_Pic(int member_id) throws Exception {
		String sql = "DELETE FROM todo_pic WHERE pic = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, member_id); //탈퇴한 멤버 id
		pstmt.executeUpdate();
		pstmt.close();
	}	
	
	//문서 담당자 변경
	void setDocument_Pic(int member_id, int document_id) throws Exception {
		String sql = "UPDATE document SET pic = ? WHERE document_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, member_id);
		pstmt.setInt(2, document_id);
		pstmt.executeUpdate();
		pstmt.close();
	}
	
	//협업공간 검색            
	void searchWorkspace_Name(String input) throws Exception {
		String sql = "SELECT workspace_name FROM workspace WHERE REGEXP_LIKE(workspace_name, ?, 'i') AND workspace_name <> '프라이빗'";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, input); //스캐너로 입력받음
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			System.out.println(rs.getString("workspace_name"));
		}
		rs.close();
		pstmt.close();
		
	//협업공간에서 전체검색	
		
		
		
		
		
		
		
	}
	
} //workspace class 종료
//-----------------------------------------------------------------------------------------------------------------------------------------------------	
	
	class Document extends Dbc{
//		Workspace w = new Workspace();
		
		
		//임시저장목록
		ArrayList<String> drafts_List() throws Exception {//시간 계산하기
			String sql = "SELECT k.kanban_icon_p, d.title, to_char(d.edit_date, 'yyyy.mm.dd hh24:mi:ss') as edit_date, w.workspace_name " + 
					"FROM document d, workspace w, kanban_icon k WHERE d.workspace_id = w.workspace_id AND k.kanban_icon_id = d.kanban_icon_id " + 
					"AND d.writer_id = ? AND d.drafts = 1 ORDER BY d.edit_date DESC";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ArrayList<String> list = new ArrayList<String>();
			pstmt.setInt(1, member_id); //로그인한 id
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				String k_icon_p = rs.getString("kanban_icon_p");
				String title = rs.getString("title");
				String edit_date = rs.getString("edit_date");
				String workspace_name = rs.getString("workspace_name");
				list.add(k_icon_p + "\t" + title + "\t" + edit_date + "\t" + workspace_name);
			}
			rs.close();
			pstmt.close();
			return list;
		}
		
		
		//임시저장 문서 삭제 새문서로 안감
		void delDrafts(int document_id) throws Exception {
			String sql = "DELETE FROM document WHERE document_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, document_id); //선택한 문서id
			pstmt.executeUpdate();
			pstmt.close();
		}
		
		
		//문서작성 클릭  but, 아무것도 안쓰면 임시저장 안됨.  근데 이거는 에디터 쓰면 어케될지 몰겟음
		void setDocument(String title, String content) throws Exception {
			String sql = "INSERT INTO document (document_id, writer_id, workspace_id, title, content, edit_date, drafts) " + 
					"VALUES (document_id.nextval, ?, ?, ?, ?, SYSDATE, 1)"; 
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id); //로그인한 id
			pstmt.setInt(2, workspace_id); //지금있는 협업공간id, 메인에선 프라이빗
			if(title == null & content != null) {
				pstmt.setString(3, content);
			} else if(title != null & content == null){
				pstmt.setString(3, title);
			}
			pstmt.setString(4, content);
			if(title != null || content != null) {
				pstmt.executeUpdate();
				pstmt.close();
			} else {
				return;
			}
		}
//		System.out.println("작성중인 내용은 임시저장 되었습니다."); 문서 끄거나 다른데 누르면
		
		
		
		//문서 공간 변경
		void setDocument_Workspace (int workspace_id) throws Exception {
			String sql = "UPDATE document SET workspace_id = ?, private_member = ? WHERE document_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id); //선택한 공간id
			if(workspace_id == member_id) {
				pstmt.setString(2, member_id + "_"); //프라이빗 공간이면  자신을 공유자로 우선 넣음
			} else {
				pstmt.setString(2, "");
			}
			pstmt.setInt(3, 35); //보고있는문서id
			pstmt.executeUpdate();
			pstmt.close();
		} 
		
			
		//칸반리스트
		void getKanban_List() {
			String sql = "SELECT i.kanban_icon_p, k.kanban_name FROM kanban k, kanban_icon i "
					+ "WHERE k.kanban_icon_id = i.kanban_icon_id AND k.workspace_id = ? ORDER BY k.kanban_order";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, workspace_id);//현재 공간id
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					String kanban_icon_p = rs.getString("kanban_icon_p");
					String kanban_name = rs.getString("kanban_name");
					System.out.println(kanban_icon_p + " " + kanban_name);
				}
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
		
		//문서 저장 클릭시
		void saveDocument(String title, String content) throws Exception {
			//임시저장 바꾸기
			if(title == null & content == null) {
				System.out.println("내용을 입력해 주세요.");
				return;
			}
			String sql = "UPDATE document SET drafts = 0, reader = ? WHERE document_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_id + "_");//로그인한 id
			pstmt.setInt(2, document_id);//보고있는문서id
			pstmt.executeUpdate();
			pstmt.close();
			setFixed_Comment("새 문서 작성");
			System.out.println("저장 됐습니다.");
		}	
		
		
		//문서 고정멘트 댓글
		void setFixed_Comment(String fixed_comment) {
			String sql = "INSERT INTO comments VALUES (comment_id.nextval, ?, ?, SYSDATE, ?, NULL, 1, 0)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, member_id);//로그인중id
				pstmt.setInt(2, document_id);//현재문서id
				pstmt.setString(3, fixed_comment);
				pstmt.executeUpdate();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		//칸반 문서에 들어감    화면만들때 가능하다고함.
/*		void setKanban_Document(int workspace_id) {
			String sql = "INSERT INTO Kanban_document VALUES (? || '_' || 1, ?, ?)"; //칸반
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, workspace_id);//선택한 협업공간id
				pstmt.setInt(2, getDocument_id());
				pstmt.setInt(3, 3);//시퀀스쓸건지?
				pstmt.executeUpdate();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
*/		
		
		//문서 복제 
		void copyDocument(int workspace_id, int document_id) throws Exception {
			String sql1 = "SELECT confidential FROM workspace WHERE workspace_id = ?";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, workspace_id);
			ResultSet rs1 = pstmt1.executeQuery();
			if(rs1.next()) {
				if(rs1.getInt("confidential") == 1) {
					System.out.println("협업공간의 보안 등급이 대외비로 설정되어 있어 문서를 복제할 수 없습니다.");
					rs1.close();
					pstmt1.close();
					return;
				} 
			} 
				
			//새문서 삽입
			String sql2 = "INSERT INTO document (document_id, writer_id, workspace_id, edit_date, drafts, private_member) " + 
					"VALUES (document_id.nextval, ?, ?, SYSDATE, 1, ?)"; 
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, member_id); //로그인한 id
			pstmt2.setInt(2, workspace_id); //협업공간id, 기본 프라이빗 세팅
			if(workspace_id == member_id) {
				pstmt2.setString(3, member_id + "_"); //프라이빗 공간이면  자신을 공유자로 우선 넣음
			} else {
				pstmt2.setString(3, "");
			}
			pstmt2.executeUpdate();
			pstmt2.close();
			
			
			//제목과 내용 복사
			String sql3 = "UPDATE document SET title = (SELECT title FROM document WHERE document_id = ?), " + 
					"content = (SELECT content FROM document WHERE document_id = ?) WHERE document_id = ?";
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setInt(1, document_id); //복사할 문서
			pstmt3.setInt(2, document_id); //복사할 문서
			System.out.println(getDocument_id(1));
			pstmt3.setInt(3, getDocument_id(1)); //복사하려고 방금 추가한 문서id
			pstmt3.executeUpdate();
			pstmt3.close();
			System.out.println("복제할 협업공간을 지정 후 저장해주세요.");
		} 
		
		
		//방금 만든 문서id 리턴   0(발행된문서)/1(임시저장문서)
		int getDocument_id(int drafts) {
			String sql = "SELECT max(document_id) document_id FROM document WHERE writer_id = ? AND drafts = ?";
			int document_id = 0;
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, member_id); //로그인한 id
				pstmt.setInt(2, drafts);//문서 발행여부
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					document_id = rs.getInt("document_id");
				}
			rs.close();
			pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return document_id;
		}
		
		
		//문서삭제  문서를 fk로 받던 애들도 다 사라짐
		void delDocument(int document_id) throws Exception {
			//제약조건 확인
			String sql = "DELETE FROM document WHERE document_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, document_id);//선택한 문서
			pstmt.executeUpdate();
			pstmt.close();
//			System.out.println("문서가 삭제되었습니다.");
		} //문서에 있던 할일일정의사결정삭제
		//문서를 삭제하시겠습니까? (모달창?)
		
		//문서 출력
		void showDocument() throws Exception {
			//제목과 내용 
			String sql1 = "SELECT title, content FROM document WHERE document_id = ?";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setInt(1, 34);//보고있는문서id
			ResultSet rs1 = pstmt1.executeQuery();
			if(rs1.next()) {
				String title = rs1.getString("title");
				String content = rs1.getString("content");
				System.out.println(title + "\t" + content);
			}
			rs1.close();
			pstmt1.close();
			
			//문서 일정
			String sql2 = "SELECT start_date, finish_date FROM document "
					+ "WHERE document_id = ? AND start_date IS NOT NULL";
			PreparedStatement pstmt2 = conn.prepareStatement(sql2);
			pstmt2.setInt(1, 34);//보고있는 문서
			ResultSet rs2 = pstmt2.executeQuery();
			if(rs2.next()) {
				String start_date = rs2.getString("start_date");
				String finish_date = rs2.getString("finish_date");
				System.out.println(start_date + " ~ " + finish_date);
			}
			rs2.close();
			pstmt2.close();
		}
		

		//협업공간 메인의 문서리스트 0(업뎃순)/1(등록순) 
		void getDocument_List(int fl) {
			String sql = "SELECT m.name, i.kanban_icon_p, d.title, d.edit_date, c.creation_date FROM document d, comments c, member m, kanban_icon i " + 
						"WHERE d.document_id = c.document_id AND d.writer_id = m.member_id AND d.workspace_id = ? " + 
						"AND d.kanban_icon_id = i.kanban_icon_id AND c.content = '새 문서 작성' ORDER BY ? DESC";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, workspace_id);//현재공간id	
				pstmt.setString(2, (fl == 0 ? "edit_date" : "creation_date"));
//				if(fl == 0) {
//					pstmt.setString(2 ,"edit_date");
//				} else if(fl == 1) {
//					pstmt.setString(2, "creation_date");
//				}
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					String name = rs.getString("name");
					String kanban_icon_p = rs.getString("kanban_icon_p");
					String title = rs.getString("title");
					String date = rs.getString((fl == 0 ? "edit_date" : "creation_date"));
//					if(fl == 0) {
//						date = rs.getString("edit_date");
//					} else if(fl == 1) {
//						date = rs.getString("creation_date");
//					}
					System.out.print(name + "\t" + kanban_icon_p + "\t" + title + "\t" + date);
//					showTime(date);
				}
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
			
		//시간조건
		void showTime(String date) {
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy.MM.dd am HH:mm:ss");
//			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.S");
			LocalTime crt = LocalTime.parse(date, formatter); //발행시간
			LocalDate crd = LocalDate.parse(date, formatter); //발행일자
			LocalDateTime cr = LocalDateTime.of(crd.getYear(), crd.getMonthValue(), crd.getDayOfMonth(), crt.getHour(), crt.getMinute(), crt.getSecond());
			LocalDateTime calDate = LocalDateTime.now(); //현재시각
			LocalDateTime curEnd = LocalDateTime.of(crd.getYear(), crd.getMonthValue(), crd.getDayOfMonth(), 23, 59, 59);
			if(cr.until(calDate, ChronoUnit.HOURS) < 1 ) {//발행일이 1시간 이전이면
				System.out.println(cr.until(calDate, ChronoUnit.MINUTES) + "분");
			} else if(calDate.isBefore(curEnd)) {//현재시간이 발행일자+1 00시 이전이면
				System.out.println(cr.format(DateTimeFormatter.ofPattern("a h:m")));
			} else {//발행일이 오늘 이후면 if(cr.isAfter(curEnd))
				System.out.println(crd.format(DateTimeFormatter.ofPattern("MM월 dd일")) + " "+ crt.format(DateTimeFormatter.ofPattern("a h:m")));
			}
		}
		
	
		//문서수정 글자 써질때마다 업데이트??
		//문서제목수정
		void setDocument_Title(String title, int document_id) throws Exception {
			String sql = "UPDATE document SET title = ?, edit_date = SYSDATE WHERE document_id = ?"; 
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title); //스캐너 입력
			pstmt.setInt(2, document_id); //현재문서
			pstmt.executeUpdate();
			pstmt.close();
			System.out.println("제목이 저장 되었습니다.");
		} 
		
		
		//문서내용수정
		void setDocument_Content(String content, int document_id) throws Exception {
			String sql = "UPDATE document SET content = ?, edit_date = SYSDATE WHERE document_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, content); //스캐너 입력
			pstmt.setInt(2, document_id); //현재문서
			pstmt.executeUpdate();
			pstmt.close();
		}
		
		
		
		//문서일정변경   간트차트 훔쳐오기?
		//문서 담당자 설정
		
		
		//프라이빗 공유자 회사동료() + 외부협업자()   getPartner_id();
		
		
		//프라이빗 공유자 변경      선택한 공유자(나는 제외) list 받기
		void setPrivate_Pic(ArrayList<Integer> list) throws Exception {
			String sql = "UPDATE document SET private_member = ?, edit_date = SYSDATE WHERE document_id = ?"; 
			PreparedStatement pstmt = conn.prepareStatement(sql);
			String members = member_id + "_";
			for(int i = 0; i < list.size(); i++) {
				members += (list.get(i) + "_");  //처음부터 list에 id_로 받아오기
			}
			pstmt.setString(1, members); //공유자
			pstmt.setInt(2, 50); //보고있는문서id
			pstmt.executeUpdate();
			pstmt.close();
		} 
//		svt&jsp
		//내가 작성한 문서 보기
		//내가 작성한 문서(최근 등록일 순1 & 업데이트 순0(디폴트))
		void getMyDocument(int fl) {
			String sql = "SELECT k.kanban_icon_p, d.title, w.workspace_name, d.edit_date, c.creation_date " + 
					"FROM document d, workspace w, comments c, kanban_icon k WHERE w.workspace_id = d.workspace_id AND d.document_id = c.document_id " + 
					"AND k.kanban_icon_id = d.kanban_icon_id AND c.comment_writer = ? AND c.content = '새 문서 작성' ORDER BY ? DESC";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, member_id); //로그인한 멤버
				pstmt.setString(2, (fl == 0 ? "edit_date" : "creation_date"));
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					String kanban_icon_p = rs.getString("kanban_icon_p");
					String title = rs.getString("title");
					String workspace_name = rs.getString("workspace_name");
					String date = rs.getString((fl == 0 ? "edit_date" : "creation_date"));
					System.out.println(kanban_icon_p + "\t" + title + "\t" + workspace_name + "\t" + date);
//					showTime(date);
				}
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} 
		}
		
		
		//내가 작성한 댓글(최신순)
		void getMyComments() {
			String sql = "SELECT c.content, w.workspace_name, d.title, to_char(c.creation_date, 'yyyy.fmmm.dd AM hh:mi') \"creation_date\" FROM comments c, document d, workspace w "
					+ "WHERE c.comment_writer = ? AND c.document_id = d.document_id AND d.workspace_id = w.workspace_id AND c.fixed_comment = 0 ORDER BY c.creation_date DESC";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, member_id); //로그인한 멤버
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					String content = rs.getString("content");
					String workspace_name = rs.getString("workspace_name");
					String title = rs.getString("title");
					String creation_date = rs.getString("creation_date");
					System.out.println(content + " " + workspace_name + " " + title + " "+ creation_date);
//					showTime(creation_date);
				}
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		
		//일정 시작-----------------------------------------------------------------------------------------------------------------------------------
		
		
//		일정작성 클릭하면
		//자신의 협업공간 리스트, 해당 공간 멤버리스트, 
		
		//일정클릭 (누르면)
		void setSchedule(int workspace_id, String title, String content) {
			if(title == null & content == null) {
				return;
			}
			String sql = "INSERT INTO schedule (schedule_id, workspace_id, writer_id, title, content, start_date, finish_date, drafts) VALUES (schedule_id.nextval, ?, ?, ?, ?, SYSDATE, SYSDATE, 1)"; 
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, workspace_id); //현재공간id
				pstmt.setInt(2, member_id);//작성자id
				pstmt.setString(3, title);
				pstmt.setString(4, content);
				pstmt.executeUpdate();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		//일정저장(클릭)
		void setSchedule(int workspace_id, ArrayList<Integer> list, String title, String content, String locations) {
			String sql = "INSERT INTO schedule (schedule_id, workspace_id, writer_id, attendee, title, content, locations, reader, drafts, start_date, finish_date)VALUES (schedule_id.nextval, ?, ?, ?, ?, ?, ?, ?, 0, SYSDATE, SYSDATE)"; 
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, workspace_id);
				pstmt.setInt(2, member_id);//작성자id
				String attendee = "";
				for(int i = 0; i < list.size(); i++) {
					attendee += (list.get(i) + "_");  //처음부터 list에 id_로 받아오기
				}
				pstmt.setString(3, attendee);//참석자id
				pstmt.setString(4, title);
				pstmt.setString(5, content);
				pstmt.setString(6, locations);
				pstmt.setString(7, member_id + "_");//저장하면 바로 읽게됨
				pstmt.executeUpdate();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
		//기존문서연결
		void connDocument(int document_id, int schedule_id) {
			String sql = "UPDATE schedule SET document_id = ?, edit_date = SYSDATE WHERE schedule_id = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, document_id); //연결한 문서id
				pstmt.setInt(2, schedule_id); //연결한일정id
				pstmt.executeUpdate();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}		
			setEdit_date(member_id, document_id);
			setFixed_Comment("일정 문서에 연결됨");
		}
		
		
		//문서수정
		void setEdit_date(int member_id, int document_id) {//reader = 로그인한ID(콤마로 찍기)
			String sql = "UPDATE document SET edit_date = SYSDATE WHERE document_id = ?"; 
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, document_id); //연결한 문서
				pstmt.executeUpdate();
				pstmt.close();
			} catch (SQLException e) {//로그인한id
				e.printStackTrace();
			}
		}
		//새문서연결 -> 문서작성&저장과 같음
		
		
		//일정출력
		
		
		
		//  공간id를 넣으면 그 공간의 배열 리턴
		//캘린더 일정 내용만 arrayList로 출력  	
		ArrayList<String> getCalender(int workspace_id, int fl) { //0(해제)/1(적용)
			String sql = "SELECT to_char(start_date, 'fm AM hh:mi') \"start_date\", title "
					+ "FROM (SELECT * FROM schedule WHERE workspace_id = ? ORDER BY start_date)";
			ArrayList<String> list = new ArrayList<String>();
			try {
				if(fl == 0) {
					return null;
				}
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, workspace_id);//일정출력할 공간id
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					list.add(rs.getString("start_date") + "\t" + rs.getString("title"));
				}
				rs.close();
				pstmt.close();
				return list;
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;//출력할때 몇일 일정인지 어케 식별할건지
		}
		
		
//		수정중인 일정을 저장하지 않고 나가겠습니까? 모달창??
//		System.out.println("일정이 수정되었습니다.");	
		
		//일장필터.. 입력한 기간의 내 일정 보기 
		
		
		//내일정만 보기   내가 작성자이거나 참석자  공간별로 보기
		ArrayList<String> showMySchedule(int workspace_id, int fl) {
			String sql = "SELECT to_char(start_date, 'AM fmhh:mi') \"start_date\", title " + 
					"FROM schedule WHERE workspace_id = ? AND (writer_id = ? OR substr(attendee, 1, length(?)+1) = ?||'_' " + 
					"OR instr(attendee, '_'|| ? ||'_', 1) > 0) ORDER BY start_date";
					ArrayList<String> list = new ArrayList<String>();
			try {
				if(fl == 0) {
					return getCalender(workspace_id,1);
				}
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, workspace_id); //선택한 공간id
				for(int i = 2; i <= 5; i++) {
					pstmt.setInt(i, member_id); //로그인한 id
				}
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					list.add(rs.getString("start_date") + " " + rs.getString("title"));
				}
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}

		
		//시작일 ~ 종료일 필터  0(해제)/1(적용)
		ArrayList<String> showSchedule_Date(String start_date, String finish_date, int workspace_id, int fl) {
			String sql = "SELECT to_char(start_date, 'AM fmhh:mi') \"start_date\", title FROM schedule " + 
					"WHERE start_date BETWEEN ? AND ? AND workspace_id = ? ORDER BY start_date";
			ArrayList<String> list = new ArrayList<String>();
			try {
				if(fl == 0) { //필터 해제
					return getCalender(workspace_id,1);
				}
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, start_date);
				pstmt.setString(2, finish_date);
				pstmt.setInt(3, workspace_id); //선택한 공간id
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()) {
					list.add(rs.getString("start_date") + " " + rs.getString("title"));
				}
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
		//필터 둘다 씌우면
		ArrayList<String> showSchedule(String start_date, String finish_date, int workspace_id, int fl) {
			ArrayList<String> list = showMySchedule(workspace_id, fl);
			ArrayList<String> list2 = showSchedule_Date(start_date, finish_date, workspace_id, fl);
			list.retainAll(list2);//교집합 구함
			return list;
//			System.out.println(list);
		}
		
		
		//일정 삭제
		void delSchedule(int schedule_id) {
			String sql = "DELETE FROM schedule WHERE schedule_id = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, schedule_id);//선택한일정id
				pstmt.executeUpdate();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
//			 (누르면 일정을 삭제하시겠습니까? 창뜸)
			System.out.println("일정이 삭제되었습니다.");
		}
		
		
	} //document class 끝.
	
	class Chatting extends Dbc{
		//안읽은 메세지 
		int unCheckedChat(int workspace_id) throws Exception {
			String sql = "SELECT reader FROM chatting_message WHERE chatting_room_id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);//확인안한 채팅방
			int cnt = 0;
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				boolean b = true;
				String reader = rs.getString("reader"); 
				String[] reader_List = reader.split(",");
				for(String s : reader_List) { //로그인한id
					if(Integer.parseInt(s) == member_id) {
						b = false;
						break;
					}
				}
				if(b) {
					cnt++;
				}
			}
			rs.close();
			pstmt.close();
			return cnt;
		}
	}//Chatting class 끝
	
	
	public class Collabee_WorkSpace{
		static Scanner sc = new Scanner(System.in);
		static Workspace obj = new Workspace();
		static Document docu = new Document();
		static Chatting chat = new Chatting();
		public static void main(String[] args) throws Exception {
			docu.getConnection();
			obj.getConnection();
			chat.getConnection();
/*			while(true) {
			System.out.print("메뉴를 고르세요.");
			System.out.println("===============");
			System.out.println("1. 협업공간 만들기\n2. 내 협업공간\n3. 문서 작성하기\n4. 내가 작성한 문서\n5. 일정 작성하기\n6. 캘린더보기\n7. 삭제하기");
			System.out.println("===============");
			int num = sc.nextInt();
			switch(num) {
			case 1 : 
			
			
			case 2:
				
				
			case 3:	
			
				
			case 4:
				
				
			case 5:
				
				
			case 6:
			
			
			case 7: 
				
			
			case 8:if((1+1)==2) {
				docu.conn.close();
				obj.conn.close();
				System.out.println("정상종료");
				System.exit(0);
			}
				
			}
			
			System.out.println("\n\n\n공간리스트");
			System.out.println(obj.getMyWorkspace_List());
			System.out.println("\n\n\n멤버리스트");
			obj.getWorkspace_MemberList();
			System.out.println("\n\n\n제목과 설명");
			obj.getWorkspace_Title();
			System.out.println("\n\n\n회사동료");
			obj.getColleague();
			System.out.println("\n\n\n외부협업자");
			obj.getExtraPartner(); 
			System.out.println("\n\n\n멤버 삭제");
			obj.delWorkspace_Mb(1);
			System.out.println("\n\n\n공간 검색");
			obj.searchWorkspace_Name("t");
			
			System.out.println("--------------------------");
			obj.setWorkspace_Name("야호"); 
			obj.setSchedule_Attendee(8,2,0);//감동...
			System.out.println();
			System.out.println();
			System.out.println();			
			
			System.out.println();
			
			System.out.println();
			obj.setSchedule_Attendee(8, 2, 0);
			System.out.println("\n\n\n 협업공간이름 리턴");
			System.out.println(obj.rtWorkspace_Name());
			System.out.println();

			System.out.println("\n임시저장목록");
			docu.drafts_List();
			System.out.println("\n문서");
			docu.showDocument();
			
			
			
			System.out.println("\n\n\n내가쓴 댓글");
			docu.getMyComments();
			System.out.println("\n\n\n내가 쓴 문서");
			docu.getMyDocument(1);
			System.out.println("\n\n메인화면 문서리스트");
			docu.getDocument_List(0);
			System.out.println("\n\n\n 일정리스트");
			System.out.println(docu.getCalender(8,1));
			System.out.println("\n\n\n내 일정 보기");
			System.out.println(docu.showMySchedule(8,1));
			System.out.println("\n\n\n시간필터로 보기");
			System.out.println(docu.showSchedule_Date("22.3.5","22.5.25",8,1));
			System.out.println("\n\n\n 동시에하면..");
			docu.showSchedule("22.3.5","22.5.25",8,1);
			System.out.println("\n\n\n\n");
			} //while끝
*/			/*
			System.out.println("내 공간 리스트");
			System.out.println(obj.getMyWorkspace_List());
			System.out.println("\n\n\n공간 타이틀");
			obj.getWorkspace_Title();
			System.out.println("\n\n\n내 동료");
			obj.getColleague();
			System.out.println("\n\n\n내 외부협업자");
			obj.getExtraPartner();
			System.out.println("\n\n\n이 공간 멤버");
			obj.getWorkspace_MemberList();
			obj.setWorkspace("잘되나요", "#48362", "잘돼요", "www.ilovechocolate.com");
			System.out.println("\n\n\n파트너 공간에 초대");
			ArrayList<Integer> list = new ArrayList<>(Arrays.asList(8, 9));
			obj.partner_invite(list);
			System.out.println("\n\n\n초대메일 보내기");
			obj.newPartner_Invite("monstax@gmail.com");
*/			
//			System.out.println("초대수락\n\n\n");
//			obj.acceptance("monstax@gmail.com", "monstax@gmail.com");
//			System.out.println("초대거절\n\n\n");
//			obj.refusal("monsterx@gmail.com");
//			System.out.println("내파트너id\n\n\n");
//			System.out.println(obj.getPartner_id());
//			System.out.println("초대링크\n\n\n");
//			obj.getWorkspace_url();
//			System.out.println("협업공간이름 리턴\n\n\n");
//			System.out.println(obj.rtWorkspace_Name());
//			System.out.println("협업공간 이름 수정\n\n\n");
//			obj.setWorkspace_Name("타타타");
//			System.out.println("협업공간 설명 수정\n\n\n");
//			obj.setWorkspace_Summary("dfjhkldk");
//			System.out.println("협업공간 대외비\n\n\n");
//			obj.setWorkspace_Confidential(0);
//			System.out.println("협업공간완료\n\n\n");
//			obj.setWorkspace_Complete(1);
//			System.out.println("협업공간 알림 설정\n\n\n");
//			obj.setWorkspace_Alarm(1);
			
//			System.out.println("협업공간 삭제 1명\n\n\n");
//			obj.delWorkspace_1(); //삭제
//			System.out.println("협업공간 삭제 동의여부\n\n\n");
//			obj.delWorkspace_Fl(); //동의
//			System.out.println("협업공간 삭제 여러명\n\n\n");
//			obj.delWorkspace_n(); //삭제
			
			
			
			
//			System.out.println("공간 관리자 설정\n\n\n");
//			obj.setWorkspace_Manager(1, 7);
//			System.out.println("소식테이블에 전송\n\n\n");
//			obj.setNews(8,);// 소식보내기
//			System.out.println("공간 멤버 탈퇴\n\n\n");
//			obj.delWorkspace_Mb(9);// 멤버탈퇴
//			System.out.println("일정 참석자 수정\n\n\n");
//			obj.setAttendee(8,0);
//			System.out.println("읽은사람 표시\n\n\n");
//			obj.setReader(2, 1); //0추가
//			System.out.println("할일 담당자 삭제\n\n\n");
//			obj.delTodo_Pic(2);
//			System.out.println("문서 담당자 변경\n\n\n");
//			obj.setDocument_Pic(2, 33);
//			System.out.println("협업공간 이름 검색\n\n\n");
//			obj.searchWorkspace_Name("프"); //검색
//			System.out.println("\n\n\n안읽은 메세지");
//			System.out.println(chat.unCheckedChat());
			
//			System.out.println("임시저장목록");
//			System.out.println(docu.drafts_List()); //
//			System.out.println("\n\n임시저장 삭제");
//			docu.delDrafts(33);// 임시저장삭제
//			System.out.println("\n\n문서작성");
//			docu.setDocument("하하", ""); //
//			System.out.println("\n\n문서 공간 선택");
//			docu.setDocument_Workspace(2); //문서 공간 선택
//			System.out.println("\n\n문서저장");
//			docu.saveDocument(null, "5년안에 엄마 고급빌라에 입주시킨다."); //
//			System.out.println("\n\n칸반리스트");
//			docu.getKanban_List(); //
//			
//			System.out.println("\n\n");
//			setFixed_Comment(String fixed_comment);// 문서 고정멘ㄴ트 실행 ㄴ
//			System.out.println("\n\n문서복제");
//			docu.copyDocument(11, 35);// 
//			System.out.println("\n\n방금만든문서 리턴");
//			System.out.println(docu.getDocument_id(int drafts));// 
//			System.out.println("\n\n 문서삭제");
//			delDocument(34);//
//			System.out.println("\n\n문서출력 일정출력");
//			docu.showDocument();// 
//			System.out.println("\n\n협업공간 메인 문서목록0업뎃/1등록");
//			docu.getDocument_List(0); 
//			System.out.println("\n\n문서제목수정");
//			docu.setDocument_Title("돈은 내가 원하는 모든 것을 이룰 수 있게 한다.", 40);
//			System.out.println("\n\n문서내용수정");
//			docu.setDocument_Content("나는 돈을 통해 주변 사람들을 기쁘게 할것이다.", 40);
//			System.out.println("\n\n선택한 공유자(arrayLIst)");
//			ArrayList<Integer> list = ;
//			docu.setPrivate_Pic(new ArrayList<Integer>(Arrays.asList(1,3,5,6))); 
			System.out.println("\n\n내가작성한 문서보기 0/1");
			docu.getMyDocument(0); //정렬 안되는 이유좀
//			System.out.println("\n\n내가작성한댓글");
//			docu.getMyComments(); 
//			System.out.println("\n\n일정 클릭");
//			docu.setSchedule(10, "esf", "asd"); 
//			System.out.println("\n\n일정 저장 참석자 arrayList");
//			docu.setSchedule(8 ,new ArrayList<Integer>(Arrays.asList(4,5,6,7,8)), "시간출력이랑", "좀 다듬기", "서울숲"); 
//			System.out.println("\n\n기존문서연결+고정멘트 + 문서수정");
//			docu.connDocument(34, 13); 
//			System.out.println("\n\n문서수정시간 시행 ㄴ");
//			setEdit_date(int member_id, int document_id);
//			System.out.println("\n\n캘린더 일정 LIst 0/체크해제 1/선택");
//			System.out.println(docu.getCalender(2, 0));
//			System.out.println("\n\n내일정만 보기");
//			System.out.println(docu.showMySchedule(8, 0)); 
//			System.out.println("\n\n시작일 종료일필터 0해제/1적용");
//			System.out.println(docu.showSchedule_Date("2022.01.01", "2022.05.30", 8, 0)); 
//			System.out.println("\n\n필터 둘다 씌우면 교집합 나오는지 확인");
//			System.out.println(docu.showSchedule("2022.01.01", "2022.05.30", 8, 1)); 
//			System.out.println("\n\n; 일정 삭제");
//			docu.delSchedule(13);
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		}
	}

		
