package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jm.dto.KanbanDocuDto;

public class KanbanDocuListByOrderDao {
	
	public ArrayList<KanbanDocuDto> KanbanDocuByOrder(String kanban_id) {
		
		Connection conn = DBConnection.getConnection();
		ArrayList<KanbanDocuDto> kdList = new ArrayList<KanbanDocuDto>();
		
		String sql = "SELECT d.document_id, d.title, kd.kanban_do_order\r\n"
				+ "FROM kanban_document kd, document d\r\n"
				+ "WHERE kd.document_id = d.document_id AND kd.kanban_id = ? ORDER BY kanban_do_order";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kanban_id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int document_id = rs.getInt("document_id");
				String title = rs.getString("title");
				int kanban_do_order = rs.getInt("kanban_do_order");
				
				kdList.add(new KanbanDocuDto(document_id, title, kanban_do_order)); 
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return kdList;
	}
	
}
