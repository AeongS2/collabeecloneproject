package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import collabee.jh.dto.MyPostDto;

public class MyPostDao {
	//내가 작성한 문서(최근 등록일 순1 & 업데이트 순0(디폴트))
	
	public ArrayList<MyPostDto> getMyPost(int fl, int member_id) { 
		ArrayList<MyPostDto> list = new ArrayList<MyPostDto>();//데이터 담을 리스트
		String sql = "SELECT k.kanban_icon_p, d.title, w.workspace_name, d.edit_date, c.creation_date " + 
				"FROM document d, workspace w, comments c, kanban_icon k WHERE w.workspace_id = d.workspace_id AND d.document_id = c.document_id " + 
				"AND k.kanban_icon_id = d.kanban_icon_id AND c.comment_writer = ? AND c.content = '새 문서 작성' ORDER BY ? DESC";
		Connection conn = null;
		try {
			conn = DBConnection.getConnection();//db랑 연결
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, member_id); //로그인한 멤버 세션?
			pstmt.setString(2, (fl == 0 ? "edit_date" : "creation_date"));
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String kanban_icon_p = rs.getString("kanban_icon_p");
				String title = rs.getString("title");
				String workspace_name = rs.getString("workspace_name");
				String date = rs.getString((fl == 0 ? "edit_date" : "creation_date"));//변수라 안될수도!!
				MyPostDto dto = new MyPostDto(kanban_icon_p, title, workspace_name, date);
				list.add(dto);
//						showTime(date); 시간
			}
			DBConnection.getClose(pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list;
	} 
}
