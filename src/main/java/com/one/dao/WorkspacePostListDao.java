package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.one.dto.WorkspacePostListDto;

public class WorkspacePostListDao {
	//협업공간 메인의 문서리스트 (업뎃순)/(등록순은 에이젝스) 
	public ArrayList<WorkspacePostListDto> getDocument_List(int workspace_id) {
		ArrayList<WorkspacePostListDto> list = new ArrayList<WorkspacePostListDto>();
		String sql = "SELECT m.name, i.kanban_icon_p, d.title, to_char(c.creation_date, '\"\"yy\"년 \"mm\"월 \"dd\"일\"') creation_date, to_char(d.edit_date, '\"\"yy\"년 \"mm\"월 \"dd\"일\"') edit_date , d.document_id " +
					"FROM document d, comments c, member m, kanban_icon i " + 
					"WHERE d.document_id = c.document_id AND d.writer_id = m.member_id AND d.workspace_id = ? " + 
					"AND d.kanban_icon_id = i.kanban_icon_id AND c.content = '새 문서 작성' AND d.drafts = 0 ORDER BY c.creation_date DESC";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);//현재공간id	
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {//여기 안들어감
				String name = rs.getString("name");
				String kanban_icon_p = rs.getString("kanban_icon_p");
				String title = rs.getString("title");
				String creation_date = rs.getString("creation_date");
				String edit_date = rs.getString("edit_date");
				int document_id = rs.getInt("document_id");
				System.out.println("제목 : "+title);	
				
				WorkspacePostListDto dto = new WorkspacePostListDto(name, kanban_icon_p, title, creation_date, edit_date, document_id);
				list.add(dto);
			}
			DBConnection.getClose(pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
}
