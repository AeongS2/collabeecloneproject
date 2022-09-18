package com.jm.dao;

import java.sql.*;

public class KanbanSelectorChangeDao {
	public void KanbanSelectorChange(String kanban_id, int document_id) {
		
		Connection conn = DBConnection.getConnection();
		
		
		String sql = "SELECT count(*) FROM kanban_document WHERE kanban_id = ?";
		int cnt = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, kanban_id);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
			rs.close();
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(cnt);
		
		// 원래 칸반의 docuOrder 하나씩 밀기
		String sql1 ="UPDATE kanban_document SET kanban_do_order = kanban_do_order+1 WHERE kanban_do_order = ? AND kanban_id = ?";
		for(int i = cnt; i>=1; i--) {			// 1번부터 올리면 두번째부터 순서 겹치기때문에 거꾸로해서 한칸씩 비우면서 하기
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql1);
				pstmt.setInt(1, i);
				pstmt.setString(2, kanban_id);			
				pstmt.executeUpdate();
				
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
		
		// docuOrder 1번으로 문서 업데이트
		String sql9 = "UPDATE kanban_document SET kanban_id = ?, kanban_do_order=1 WHERE document_id = ?";
		int result = -1;
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql9);
			pstmt.setString(1, kanban_id);		
			pstmt.setInt(2, document_id);
			result = pstmt.executeUpdate();
			
			pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String sql3 ="UPDATE document SET kanban_icon_id = (SELECT kanban_icon_id FROM kanban WHERE kanban_id = ?) WHERE document_id=?";
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql3);
			pstmt.setString(1, kanban_id);
			pstmt.setInt(2, document_id);
			pstmt.executeUpdate();
			
			pstmt.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("한칸씩 밀고 집어넣고 document icon id 바꿈!");

	}
}
