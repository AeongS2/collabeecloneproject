package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jm.dto.TodoListDto;

public class TodoListWidgetDao {
	
	// 마감이 임박한 할일 리스트 (3일이내) / pic에 본인아이디가 포함 되어있는것들 
	public ArrayList<TodoListDto> todoWidgetFinish(int id) {
		
		Connection conn = DBConnection.getConnection();
		ArrayList<TodoListDto> todoDtoListW = new ArrayList<TodoListDto>();
		
		String sql = "SELECT t.todo_id, tc.todo_cur_p, t.content, m.name "
				+ "FROM todo t, todo_pic tp, todo_cur tc, member m  "
				+ "WHERE tp.todo_id = t.todo_id AND t.todo_cur_id = tc.todo_cur_id AND t.writer_id = m.member_id "
				+ "AND tp.pic = ? AND t.finish_date <= sysdate+3 AND t.finish_date >= sysdate";

		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int todo_id = rs.getInt("todo_id");
				String todo_cur_p = rs.getString("todo_cur_p");
				String content = rs.getString("content");
				String name = rs.getString("name");
				
				todoDtoListW.add(new TodoListDto(todo_id, todo_cur_p, content, name));
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return todoDtoListW;
	}
	
}
