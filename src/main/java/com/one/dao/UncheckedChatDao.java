package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UncheckedChatDao {
	//안읽은 메세지 
	int unCheckedChat(int workspace_id, int member_id) {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT reader FROM chatting_message WHERE chatting_room_id = ?";
		int cnt = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);//확인안한 채팅방
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				boolean b = true;
				String reader;
					reader = rs.getString("reader");
				String[] reader_List = reader.split(",");
				for(String s : reader_List) { //로그인한id
					if(Integer.parseInt(s) == member_id) {
						b = false;
						break;
					}
				}
				if(b) {
					cnt++;
				}
			}
		DBConnection.getClose(pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return cnt;
	}
}
