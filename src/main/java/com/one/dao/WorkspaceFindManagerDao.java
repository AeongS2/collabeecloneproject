package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.one.dto.WorkspaceFindManagerDto;

public class WorkspaceFindManagerDao { //이 공간의 매니저인지 아닌지 확인
	public ArrayList<WorkspaceFindManagerDto> findManager(int workspace_id) { 
		ArrayList<WorkspaceFindManagerDto> list = new ArrayList<WorkspaceFindManagerDto>();
		String sql = "SELECT member_id, private_fl FROM workspace_mb WHERE workspace_id = ? AND manager_id = 1";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				int member_id = rs.getInt("member_id");
				int private_fl = rs.getInt("private_fl");

				WorkspaceFindManagerDto dto = new WorkspaceFindManagerDto(member_id, private_fl);
			}
			DBConnection.getClose(pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
