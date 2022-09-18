package com.jm.dao;

import java.sql.*;
import java.util.ArrayList;

import com.jm.dto.KanbanListDto;

public class KanbanListDao {
	// 해당 협업공간의 칸반아이디, 아이콘, 이름, 순서 리스트
	public ArrayList<KanbanListDto> kanbanList(int workspace_id) {
		
		Connection conn =  DBConnection.getConnection();
		
		// 해당협업공간에 칸반 몇개 있는지
		int kanban_num = 0;
		String sql = "SELECT count(*) FROM kanban WHERE workspace_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				kanban_num = rs.getInt("count(*)");
			}
			
			pstmt.close();
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<KanbanListDto> kList = new ArrayList<KanbanListDto>();
		
		String sql1 = "SELECT k.kanban_id, ki.kanban_icon_p, k.kanban_name, k.kanban_order "
				+ "FROM kanban k, kanban_icon ki "
				+ "WHERE k.kanban_icon_id = ki.kanban_icon_id AND workspace_id = ? "
				+ "ORDER BY kanban_order ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, workspace_id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String kanban_id = rs.getString("kanban_id");
				String kanban_icon_p = rs.getString("kanban_icon_p");
				String kanban_name = rs.getString("kanban_name");
				int kanban_order = rs.getInt("kanban_order") ;
				
				kList.add(new KanbanListDto(kanban_id, kanban_icon_p, kanban_name, kanban_order, kanban_num)); 
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return kList;
	}
}
