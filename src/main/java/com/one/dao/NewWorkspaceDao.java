package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.one.dto.NewWorkspaceDto;

public class NewWorkspaceDao { //다 떼어내기!
	//협업공간 생성
	public int setWorkspace(NewWorkspaceDto dto) {
		try {
			Connection conn = DBConnection.getConnection();
			String invite_url1 = "http://localhost:9090/WebProject/Workspace_index.jsp?warkspaceName=";
			String color1="black";
			//협업공간 생성
			String sql1 = "INSERT INTO workspace (workspace_id, workspace_name, color, summary, invite_url) VALUES (workspace_id.nextval, ?, ?, ?, ?)";
			PreparedStatement pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, dto.getWorkspace_name());//입력받은것
			pstmt1.setString(2, dto.getColor()); //랜덤으로 정해줌. 화면에 보이진 않음.
			pstmt1.setString(3, dto.getSummary());
			pstmt1.setString(4, invite_url1);//어떻게 만들어짐?? 이름이랑 id로?
			int result = pstmt1.executeUpdate();
			DBConnection.pstmtClose(pstmt1);
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return 1;
	}
	
	public int getNewWorkspace_id(String workspaceName) {
		int workspace_id = 0;
		try {
			//지금 있는 공간의 id 
			String invite_url1 = "http://localhost:8080/WebProject/newCollabee/Workspace.jsp";//현재 공간의 url get.requestURL()
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT workspace_id FROM workspace WHERE workspace_name = ?"; 
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, workspaceName);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				workspace_id = rs.getInt("workspace_id");
			}
			DBConnection.getClose(pstmt, rs);
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return workspace_id;
	}
	
	public int connectWorkspace(int member_id, int workspace_id) {
			int result = 0;
		try {
			//최근접속한 공간 추가
			Connection conn = DBConnection.getConnection();
		    String sql3 = "INSERT INTO recent_connection_workspace VALUES (?, RECENT_CONNECTION_ID.nextval, ?, SYSDATE)";
			PreparedStatement pstmt3 = conn.prepareStatement(sql3);
			pstmt3.setInt(1, member_id); //로그인한id
			pstmt3.setInt(2, workspace_id);//현재공간id
			result = pstmt3.executeUpdate();
			pstmt3.close();
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return 1;
			}
	
	public int setWorkspaceMember(int member_id, int workspace_id) {
			int result = 0;
		try {
			//협업공간 멤버 및 관리자 추가
			Connection conn = DBConnection.getConnection();
			String sql4 = "INSERT INTO workspace_mb (workspace_mb_id, workspace_id, member_id, manager_id, manager_icon_id) VALUES (WORKSPACE_MB_ID.nextval, ?, ?, 1, 1)";
			PreparedStatement pstmt4 = conn.prepareStatement(sql4);
			pstmt4.setInt(1, workspace_id);//리턴받은거
			pstmt4.setInt(2, member_id);//로그인한id
			pstmt4.executeUpdate();
			pstmt4.close();
			//System.out.println(workspace_name + "협업공간이 생성되었습니다.");
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return 1;
	}
}
