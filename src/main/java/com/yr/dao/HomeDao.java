package com.yr.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.one.dao.DBConnection;
import com.yr.dto.HomeRecentDto;
import com.yr.dto.NoneFolderDto;

public class HomeDao {
	
	// 최근7개공간보기, 밑에 협업공간애들사진까지 뽑았음
	public ArrayList<HomeRecentDto> getRecent_Connection(int member_id) throws SQLException {
		ArrayList<HomeRecentDto> list = new ArrayList<HomeRecentDto>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "select w.workspace_id, "
					+ "w.workspace_name, w.color, r.recent_connection_id "
					+ "from recent_connection_workspace r, workspace w "
					+ "where r.workspace_id = w.workspace_id and r.member_id = ? "
					+ "order by r.recent_connection_id desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,member_id);
			rs = pstmt.executeQuery();
			for(int i = 0; list.size()<=6; i++) { // 7개만 뽑음
				boolean b = true;
				if (rs.next()){
					System.out.println("meow");
					int workspace_id = rs.getInt(1);
					String workspace_name = rs.getString(2);
					String color = rs.getString(3);
					int count = countMember(workspace_id);
					ArrayList<String> pictures = showPicturesWorkspaceMemberList(workspace_id);
					HomeRecentDto dto = new HomeRecentDto(workspace_id, workspace_name, color, pictures, count);
					for(int j = 0; j<i; j++) {
						int w = list.get(j).getWorkspace_id();
						if(w == workspace_id) {
							b = false;
						}
					}
					if(b) {
						list.add(dto);
					}else {
						i--;
					}
				} else if(rs.next()==false) {
					break;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		} 
		System.out.println("finish meow!");
		return list;
	}
	public int countMember(int workspace_id) {
		int count = 0;
		Connection conn = DBConnection.getConnection();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select count(workspace_id) from workspace_mb wm where wm.workspace_id = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return count;
	}
	// 논폴더용
	public ArrayList<NoneFolderDto> getHomeWorkspace(int member_id) throws SQLException {
		ArrayList<NoneFolderDto> list = new ArrayList<NoneFolderDto>();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = DBConnection.getConnection();
		try{
			String sql = "select w.workspace_id, w.workspace_name, w.color, wo.order_id from workspace w, workspace_order wo" + 
					" where w.workspace_id = wo.workspace_id and wo.member_id = ? order by wo.order_id";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,member_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int workspace_id = rs.getInt(1);
				String workspace_name = rs.getString(2);
				String color = rs.getString(3);
				int order = rs.getInt(4);
				int count = countMember(workspace_id);
				NoneFolderDto dto = new NoneFolderDto(workspace_id, workspace_name, color, count, order);
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		} 
		return list;
	}
	public void deleteWorkspaceOrder(int member_id) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "delete from workspace_order where member_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateWorkspaceOrder(int i, int member_id, int workspace_id) {
		Connection conn = DBConnection.getConnection();
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into workspace_order values(?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i);
			pstmt.setInt(2, member_id);
			pstmt.setInt(3, workspace_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	 
	
	
	
	
	
	
	
	//해당 협업공간의 멤버리스트
	public ArrayList<String> showPicturesWorkspaceMemberList(int workspace_id) throws SQLException {
		ArrayList<String> list1 = new ArrayList<String>();
		Connection conn = DBConnection.getConnection();
		String sql = "SELECT m.picture"
				+ " FROM workspace_mb wm, member m"
				+ " WHERE wm.member_id = m.member_id"
				+ " AND wm.workspace_id = ? and rownum <=3";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String picture = rs.getString("picture");
				list1.add(picture);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return list1;
	}
	
	public String showName(int member_id) {
		Connection conn = DBConnection.getConnection();
		String sql = "select name from member where member_id = ?";
		String name = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return name;
	}
	
	public String showEmail(int member_id) {
		Connection conn = DBConnection.getConnection();
		String sql = "select email from member where member_id = ?";
		String email = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				email = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return email;
	}
	public String showPicture(int member_id) {
		Connection conn = DBConnection.getConnection();
		String sql = "select picture from member where member_id = ?";
		String picture = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				picture = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return picture;
	}
	public String showCorName(int member_id) {
		Connection conn = DBConnection.getConnection();
		String sql = "select corporation_name from corporations c where c.corporation_id = (select m.corporation_id from member m where member_id = ?)";
		String CorName = "";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				CorName = rs.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return CorName;
	}
		
	public int getCountPartner(int member_id) throws SQLException {
		Connection conn = DBConnection.getConnection();
		String sql = "select count(p.my_partner) from partner p, member m where m.member_id = p.member_id and p.member_id = ?";
		int p = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				p = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return p;
	}
	
	public int gotCorporation(int member_id) {
		Connection conn = DBConnection.getConnection();
		String sql = "select corporation_id from member where member_id = ?";
		int corporation_id = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				corporation_id = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return corporation_id;
	}
	public int gotManager(int member_id) {
		Connection conn = DBConnection.getConnection();
		String sql = "select corporation_manager from member where member_id = ?";
		int corporation_manager = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				corporation_manager = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} 
		return corporation_manager;
	}
}
