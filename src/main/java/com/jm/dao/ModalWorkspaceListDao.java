package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jm.dto.ModalWorkspaceListDto;

public class ModalWorkspaceListDao {

	public ArrayList<ModalWorkspaceListDto> workspaceList(int cur_member_id) {
		
		Connection conn = DBConnection.getConnection();
		
		ArrayList<ModalWorkspaceListDto> mWList = new ArrayList<ModalWorkspaceListDto>();
		String workspace_list_sql = "SELECT w.workspace_name, w.workspace_id"
				+ " FROM workspace w, workspace_mb wm"
				+ " WHERE wm.workspace_id = w.workspace_id"
				+ " AND wm.member_id = ?"; 
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(workspace_list_sql);
			pstmt.setInt(1, cur_member_id);
			ResultSet rs = pstmt.executeQuery();
				
			
			while(rs.next()) {
				int workspace_id = rs.getInt("workspace_id");
				String workspace_name = rs.getString("workspace_name");
				
				mWList.add(new ModalWorkspaceListDto(workspace_id, workspace_name));
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
			
		return mWList;
	}
	
}
