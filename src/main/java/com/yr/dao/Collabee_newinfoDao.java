package com.yr.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.yr.dto.*;
public class Collabee_newinfoDao {
	public ArrayList<Collabee_newinfoDto> getAllBoardList() throws Exception {
		ArrayList<Collabee_newinfoDto> list1 = new ArrayList<Collabee_newinfoDto>();
		Connection conn = DBConnection.getConnection();
		String sql = "select * from collabee_newinfo order by collabee_newinfo_id desc";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			int collabee_newinfo_id = rs.getInt("collabee_newinfo_id");
			String title = rs.getString("title");
			String content = rs.getString("content");
			String date = rs.getString("creation_date");
			String[] arr = date.split(" ");
			String creation = arr[0];
			String creation_date = creation.replace("-", ".");
			Collabee_newinfoDto dto = new Collabee_newinfoDto(collabee_newinfo_id, title, content, creation_date);
			list1.add(dto);
		}
		return list1;
	}
	
	public CollabeenewinfoDto getBoard(int collabee_newinfo_id) throws Exception {
		Connection conn = DBConnection.getConnection();
		String sql = "select title, content, creation_date from collabee_newinfo where collabee_newinfo_id = ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, collabee_newinfo_id);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()) {
			String title = rs.getString("title");
			String content = rs.getString("content");
			String date = rs.getString("creation_date");
			String[] arr = date.split(" ");
			String creation = arr[0];
			String creation_date = creation.replace("-", ".");
			CollabeenewinfoDto dto = new CollabeenewinfoDto(title, content, creation_date);
			return dto;
		}
		return null;
	}
}
