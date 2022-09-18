package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jm.dto.TodoListDto;

public class TodoListDao {
	// 내 할 일 리스트 (홈)
	public ArrayList<TodoListDto> todoMyList(int id) {
		
		Connection conn = DBConnection.getConnection();
		ArrayList<TodoListDto> todoDtoList = new ArrayList<TodoListDto>();
		
		String sql = "SELECT t.todo_id, c.todo_cur_p, t.content, to_char(t.start_date, 'MM/DD') || '~' || to_char(t.finish_date, 'MM/DD') sf, w.workspace_name, "
				+ " m1.picture 작성자, m2.picture 담당자 "
				+ " FROM todo t, todo_pic p, todo_cur c, workspace w, member m1, member m2 "
				+ " WHERE  t.todo_id = p.todo_id AND t.todo_cur_id = c.todo_cur_id "
				+ " AND t.workspace_id = w.workspace_id AND t.writer_id = m1.member_id AND p.pic = m2.member_id "
				+ " AND p.pic = ? "
				+ " ORDER BY t.creation_date DESC ";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int todo_id = rs.getInt("todo_id");
				String todo_cur_p = rs.getString("todo_cur_p");
				String content = rs.getString("content");
				String date = rs.getString("sf");
				String workspace_name = rs.getString("workspace_name");
				String writer = rs.getString("작성자");
				String pic = rs.getString("담당자");
				
				todoDtoList.add(new TodoListDto(todo_id, todo_cur_p, content, date, workspace_name, writer, pic));  
				
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return todoDtoList;
	}
	
}
