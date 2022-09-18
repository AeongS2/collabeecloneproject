package com.jm.dao;

import java.sql.*;
import java.util.ArrayList;

import com.jm.dto.*;

public class BookmarkDao {
	
	public ArrayList<BookmarkDto> bookmarkList(int id) {
		
		Connection conn = DBConnection.getConnection();
		
		ArrayList<Integer> b_docuIdList = new ArrayList<Integer>();
		ArrayList<Integer> b_idList = new ArrayList<Integer>();
		
		String sql1 = "SELECT document_id, bookmark_id FROM bookmark WHERE member_id = ? ORDER BY creation_date asc";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int document_id = rs.getInt("document_id");
				b_docuIdList.add(document_id);
				
				int bookmark_id = rs.getInt("bookmark_id");
				b_idList.add(bookmark_id);
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		ArrayList<BookmarkDto> bDtoList = new ArrayList<BookmarkDto>();
		
		String sql = "SELECT k.kanban_icon_p, d.title, w.workspace_name, m.name "
				+ "FROM document d, kanban_icon k, workspace w, member m "
				+ "WHERE d.kanban_icon_id = k.kanban_icon_id AND d.workspace_id = w.workspace_id AND d.writer_id = m.member_id "
				+ "AND d.document_id = ?";
		
		for(int i = 0; i<b_docuIdList.size(); i++) {
			BookmarkDto bDto = new BookmarkDto();
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, b_docuIdList.get(i));
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()) {
					String kanban_icon_p = rs.getString("kanban_icon_p");
					String title = rs.getString("title");
					String workspace_name = rs.getString("workspace_name");
					String name = rs.getString("name");
					
					bDto.setKanban_icon_p(kanban_icon_p);
					bDto.setTitle(title);
					bDto.setWorkspace_name(workspace_name);
					bDto.setName(name);
					bDto.setBookmark_id(b_idList.get(i));
					bDtoList.add(bDto);

				}
				rs.close();
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return bDtoList;
	}
	
}
