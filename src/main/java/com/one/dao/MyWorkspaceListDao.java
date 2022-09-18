package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.one.dto.MyWorkspaceListDto;

public class MyWorkspaceListDao {
	
	//내가 가입한 협업공간 목록
	public ArrayList<MyWorkspaceListDto> getMyWorkspace_List(int member_id) {
		String sql = "SELECT w.*, m.workspace_alarm FROM workspace w, workspace_mb m " 
				+ "WHERE w.workspace_id = m.workspace_id AND m.member_id = ? ORDER BY w.creation_date";
		Connection conn = DBConnection.getConnection();
		ArrayList<MyWorkspaceListDto> list = new ArrayList<MyWorkspaceListDto>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);//로그인한 id 세션?
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int workspace_id = rs.getInt(1);
				String workspace_name = rs.getString(2); 
				String color = rs.getString(3);  
				String summary = rs.getString(4); 
				String invite_url = rs.getString(5);
				int confidential = rs.getInt(6);
				int complete = rs.getInt(7);
				String creation_date = rs.getString(8);
				int workspace_alarm = rs.getInt("workspace_alarm");
				
				MyWorkspaceListDto dto = new MyWorkspaceListDto(workspace_id, workspace_name, color, summary, invite_url,
						confidential, complete, creation_date, workspace_alarm);
				list.add(dto);
			}
			
			DBConnection.getClose(pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list; 
	}
}
