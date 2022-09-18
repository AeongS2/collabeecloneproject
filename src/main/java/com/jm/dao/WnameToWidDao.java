package com.jm.dao;

import java.sql.*;

public class WnameToWidDao {
	public int getWid(String workspace_name) {
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT workspace_id "
				+ "FROM workspace WHERE workspace_name = ?";
		int workspace_id = 0;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, workspace_name);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				workspace_id = rs.getInt("workspace_id");
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return workspace_id;
	}
	
}
