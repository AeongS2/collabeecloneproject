package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Random;

public class NewChattingRoomInsertDao {
	public int NewChattingRoomInsert(String nc_list, int member_id) {
		
		ArrayList<Integer> nc = new ArrayList<Integer>();

			
		String[] str = nc_list.split("_");
			
		for(int i = 0; i<str.length; i++) {
			nc.add( Integer.parseInt(str[i]) );
		}
		
		nc.add(member_id);
		
		// 고유번호생성
		Random rnd = new Random();
		String uniqueN = rnd.nextInt(90000) + 10000 + "";
		
		Connection conn = DBConnection.getConnection();
		
		String sql = "INSERT INTO chatting_room VALUES (chatting_room_id.nextval, null, ?)";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uniqueN);
			pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String sql1 = "SELECT chatting_room_id a FROM chatting_room WHERE chatting_name=?";
		int cr_id = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, uniqueN);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cr_id = rs.getInt("a");
			}
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		for(int i = 0; i<nc.size(); i++) {
			String sql2= "INSERT INTO chatting_room_member VALUES (?, ?, 0)";
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql2);
				pstmt.setInt(1, cr_id);
				pstmt.setInt(2, nc.get(i));
				pstmt.executeUpdate();
				
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return cr_id;
	}
}
