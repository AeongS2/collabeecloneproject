package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KanbanInsertDao {

	// 새문서상태 추가 
	public void kanbanInsert(int workspace_id, String kanban_name, int kanban_icon_id) {
		Connection conn = DBConnection.getConnection();
		
		// 선택한 협업공간에 문서상태 몇개 있는지 확인
		int ws_kanban_num = 0;
		String sql1 = "SELECT count(*) FROM kanban WHERE workspace_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, workspace_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ws_kanban_num = rs.getInt("count(*)");
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		

		
		// 칸반아이디 만들기
		String sql ="SELECT kanban_id FROM kanban WHERE workspace_id=?";
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				if( workspace_id<10 ) {
					String kanban_id = rs.getString("kanban_id").substring(2);
					list.add(Integer.parseInt(kanban_id));
				}else if(workspace_id<100){
					String kanban_id = rs.getString("kanban_id").substring(3);
					list.add(Integer.parseInt(kanban_id));
				}else if(workspace_id<1000) {
					String kanban_id = rs.getString("kanban_id").substring(4);
					list.add(Integer.parseInt(kanban_id));
				}
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		int new_kanban_id_int = 0;
		for(int i = 0; i<list.size(); i++) {
			if(new_kanban_id_int < list.get(i)) {
				new_kanban_id_int = list.get(i);				
			}
		}
		
		new_kanban_id_int += 1;
		String new_kanban_id = workspace_id + "_" + new_kanban_id_int;

		
		// 칸반에 추가
		String sql2 = "INSERT INTO kanban VALUES ( ?, ?, ?, ?, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql2);
			pstmt.setInt(1, workspace_id);
			pstmt.setString(2, new_kanban_id);
			pstmt.setString(3, kanban_name);
			pstmt.setInt(4, kanban_icon_id);
			pstmt.setInt(5, ws_kanban_num+1);
			pstmt.executeUpdate();	// 
			
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
}
