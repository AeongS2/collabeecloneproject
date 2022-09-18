package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jm.dto.TodoDetailDto;

public class TodoDetailDao {
	
	public TodoDetailDto TodoDetailList(int todo_id) {
		
		Connection conn = DBConnection.getConnection();
		TodoDetailDto tDto = new TodoDetailDto(); 
		
		String sql1 = "SELECT m.name, m.picture "
				+ "FROM todo_pic tp, member m "
				+ "WHERE tp.pic = m.member_id AND todo_id = ?";
		String pic_name ="";
		String pic_p = "";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setInt(1, todo_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pic_name = rs.getString("name");
				pic_p = rs.getString("picture");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String sql = "SELECT t.todo_id, tc.todo_cur_p, t.content, to_char(t.start_date, 'YYYY/MM/DD') s, to_char(t.finish_date, 'YYYY/MM/DD') f, t.des, m.name, m.picture "
				+ "FROM todo t, member m, todo_cur tc "
				+ "WHERE t.writer_id = m.member_id AND t.todo_cur_id = tc.todo_cur_id AND todo_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, todo_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String todo_cur_p = rs.getString("todo_cur_p");
				String content = rs.getString("content");
				String start_date = rs.getString("s");
				String finish_date = rs.getString("f");
				String des = rs.getString("des");
				String writer_name = rs.getString("name");
				String writer_p = rs.getString("picture");
				
				tDto = new TodoDetailDto(todo_id, todo_cur_p, content, start_date, finish_date, des, writer_name, writer_p, pic_name, pic_p);
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return tDto;
		
	}
}
