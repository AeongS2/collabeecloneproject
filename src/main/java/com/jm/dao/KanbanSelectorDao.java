package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jm.dto.KanbanSelectorDto;

public class KanbanSelectorDao {
	public ArrayList<KanbanSelectorDto> KanbanSelector(int workspace_id) {
		
		Connection conn = DBConnection.getConnection();
		
		ArrayList<KanbanSelectorDto> kanbanSelectorList = new ArrayList<KanbanSelectorDto>();
		
		String sql = "SELECT k.kanban_id, ki.kanban_icon_p, k.kanban_name  "
				+ "FROM kanban k, kanban_icon ki  "
				+ "WHERE k.kanban_icon_id = ki.kanban_icon_id  "
				+ "AND workspace_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String kanban_id = rs.getString(1);
				String kanban_icon_p = rs.getString(2);
				String kanban_name = rs.getString(3);
				
				kanbanSelectorList.add(new KanbanSelectorDto(kanban_id, kanban_icon_p, kanban_name));
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return kanbanSelectorList;
	}
}
