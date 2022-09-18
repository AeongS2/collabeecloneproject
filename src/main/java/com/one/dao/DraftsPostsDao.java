package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.one.dto.DraftsPostsDto;

public class DraftsPostsDao {
	//임시저장목록
	public ArrayList<DraftsPostsDto> drafts_List(int member_id) {//시간 계산하기
		ArrayList<DraftsPostsDto> list = new ArrayList<DraftsPostsDto>();
		String sql = "SELECT k.kanban_icon_p, d.document_id, d.title, d.content, to_char(d.edit_date, 'yyyy.mm.dd') as edit_date, w.workspace_name, w.workspace_id " + 
				"FROM document d, workspace w, kanban_icon k WHERE d.workspace_id = w.workspace_id AND k.kanban_icon_id = d.kanban_icon_id " + 
				"AND d.writer_id = ? AND d.drafts = 1 ORDER BY d.edit_date DESC";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id); //로그인한 id
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { 
				String k_icon_p = rs.getString("kanban_icon_p");
				int document_id = rs.getInt("document_id");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String edit_date = rs.getString("edit_date");
				String workspace_name = rs.getString("workspace_name");
				int workspace_id = rs.getInt("workspace_id");
				DraftsPostsDto dto = new DraftsPostsDto(k_icon_p, document_id, title, content, edit_date, workspace_name, workspace_id); 
				list.add(dto);
			}
			DBConnection.getClose(pstmt, rs);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
