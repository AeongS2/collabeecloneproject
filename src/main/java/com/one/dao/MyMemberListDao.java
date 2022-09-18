package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.one.dto.MemberInfoDto;

public class MyMemberListDao {
	//회사동료
	public ArrayList<MemberInfoDto> getColleague(int corporation_id, int login_id) {
		ArrayList<MemberInfoDto> list = null;
		try {
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT picture, name FROM member WHERE corporation_id = ? AND member_id <> ?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, corporation_id);
		pstmt.setInt(2, login_id); //로그인한
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			int member_id = rs.getInt("member_id");
			String email = rs.getString("email");
			String picture = rs.getString("picture");
			String name = rs.getString("name");
			String manager_icon_p = rs.getString("manager_icon_p");
			
			MemberInfoDto dto = new MemberInfoDto(picture, member_id, email, name, manager_icon_p);
			list.add(dto);
		}
		DBConnection.getClose(pstmt, rs);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//외부협업자
	public ArrayList<MemberInfoDto> getExtraPartner(int login_id, int corporation_id) {
		ArrayList<MemberInfoDto> list = null;
		String sql =  "SELECT member_id, email, name, picture FROM member WHERE member_id IN (SELECT my_partner FROM partner WHERE member_id = ? AND hide_partner = 'N') "
				+ "AND corporation_id <> ? OR corporation_id IS NULL";
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt;
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, login_id);
			pstmt.setInt(2, corporation_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int member_id = rs.getInt("member_id");
				String email = rs.getString("email");
				String picture = rs.getString("picture");
				String name = rs.getString("name"); 
				String manager_icon_p = rs.getString("manager_icon_p");
				MemberInfoDto dto = new MemberInfoDto(picture, member_id, email, name, manager_icon_p);
				list.add(dto);
			}
			DBConnection.getClose(pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	//현재공간에 속한 멤버 리스트
	public ArrayList<MemberInfoDto> getWorkspace_MemberList(int workspace_id) {
		ArrayList<MemberInfoDto> list = new ArrayList<MemberInfoDto>();
		String sql = "WITH MEMBER_LIST AS "
				+ "(SELECT m.picture, m.member_id, m.name, m.email, i.manager_icon_p FROM member m, workspace_mb w, manager_icon i "
				+ "WHERE m.member_id = w.member_id AND i.manager_icon_id = w.manager_icon_id AND w.workspace_id = ?)"
				+ "SELECT DISTINCT * FROM member_list"; 
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,  workspace_id);//지금 공간id
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String picture = rs.getString("picture");
				int member_id = rs.getInt("member_id");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String manager_icon_p = rs.getString("manager_icon_p");
				
				MemberInfoDto dto = new MemberInfoDto(picture, member_id, email, name, manager_icon_p);
				list.add(dto);
			}
			DBConnection.getClose(pstmt, rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}	
}
