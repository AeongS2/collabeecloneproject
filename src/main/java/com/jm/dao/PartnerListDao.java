package com.jm.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.jm.dto.PartnerListDto;

public class PartnerListDao {
	// 해당 ID의 파트너 리스트
	public ArrayList<PartnerListDto> partnerList(int cur_member_id) {
		Connection conn = DBConnection.getConnection();
		ArrayList<PartnerListDto> pL = new ArrayList<PartnerListDto>();
		
		String sql = "SELECT member_id, picture, name, email  "
				+ "FROM member  "
				+ "WHERE member_id = ?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cur_member_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int member_id = rs.getInt("member_id");
				String picture = rs.getString("picture");
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				pL.add(new PartnerListDto( member_id, picture, name, email));
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String partner_list_sql = "SELECT m.member_id, m.picture, m.name, m.email "
				+ "FROM member m, partner p "
				+ "WHERE p.my_partner = m.member_id "
				+ "AND p.member_id = ?";
			
		try {
			PreparedStatement pstmt = conn.prepareStatement(partner_list_sql);
			pstmt.setInt(1, cur_member_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int partner_member_id = rs.getInt("member_id");
				String picture = rs.getString("picture");
				String name = rs.getString("name");
				String email = rs.getString("email");
				
				pL.add(new PartnerListDto( partner_member_id, picture, name, email));
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pL;
			
	}
}
