package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import collabee.jh.dto.WorkspaceInfoDto;

public class WorkspaceInfoDao {
	//협업공간 이름, 설명
	public ArrayList<WorkspaceInfoDto> getWorkspace_Title(int workspace_id)  {
		ArrayList<WorkspaceInfoDto> list = new ArrayList<WorkspaceInfoDto>();
		try {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT workspace_name, summary FROM workspace WHERE workspace_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, workspace_id); //보고있는 공간
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			String workspace_name = rs.getString("workspace_name");
			String summary = rs.getString("summary");
			WorkspaceInfoDto dto = new WorkspaceInfoDto(workspace_name, summary);
			list.add(dto);
		}
		DBConnection.getClose(pstmt, rs);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	} 
}
