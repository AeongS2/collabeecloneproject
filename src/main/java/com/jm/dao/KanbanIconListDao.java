package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jm.dto.KanbanIconListDto;

public class KanbanIconListDao {
	
	public ArrayList<KanbanIconListDto> KanbanIconList() {
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "SELECT kanban_icon_id, kanban_icon_p FROM kanban_icon";
		ArrayList<KanbanIconListDto> kIList = new ArrayList<KanbanIconListDto>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				int kanban_icon_id = rs.getInt("kanban_icon_id");
				String kanban_icon_p =rs.getString("kanban_icon_p");
				
				kIList.add(new KanbanIconListDto(kanban_icon_id, kanban_icon_p));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return kIList;
	}
	
}
