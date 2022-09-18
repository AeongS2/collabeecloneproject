package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jm.dto.TodoListDto;

public class TodoInsertDao {
	
	// 할일 작성 (파일 null값 들어갈 수 있으니까 String)
	public int insertTODO(int workspace_id, String content, int cur_member_id, String start_date, String finish_date, String todo_des, String file_id, ArrayList<Integer> pic_list) {
		
		Connection conn = DBConnection.getConnection();
		
		int n_todo_id = 0;
		String insert_todo = "INSERT INTO todo "
				+ "VALUES (?, todo_id.nextval, ?, 1, ?, to_date(?, 'YYYY.MM.DD HH24.MI.SS'), to_date(?, 'YYYY.MM.DD HH24.MI.SS')"+
				", ?, null, null, ?, 0, sysdate, null)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(insert_todo);
			pstmt.setInt(1, workspace_id);
			pstmt.setString(2, content);
			pstmt.setInt(3, cur_member_id);
			pstmt.setString(4, start_date);
			pstmt.setString(5, finish_date);
			pstmt.setString(6, todo_des);
			pstmt.setInt(7, cur_member_id);
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 방금작성한 to_id 불러오기
		String n_todo = "select todo_id from todo "
				+ "WHERE workspace_id = ? AND content = ? AND writer_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(n_todo);
			pstmt.setInt(1, workspace_id);
			pstmt.setString(2, content);
			pstmt.setInt(3, cur_member_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				n_todo_id = rs.getInt("todo_id");
			}
			
			
			rs.close();
			pstmt.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		
		// 담당자 insert
		int pic_id;
		for(int i = 0; i<pic_list.size(); i++) {
			pic_id = pic_list.get(i);
			String insert_todo_pic = "INSERT INTO todo_pic VALUES (?, ?)";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(insert_todo_pic);
				pstmt.setInt(1, n_todo_id);
				pstmt.setInt(2, pic_id);
				pstmt.executeUpdate();
				
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return n_todo_id;
	}
	
}
