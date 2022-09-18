package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class WorkspaceDeleteDao {
	//협업공간 삭제(관리자 1명)  삭제기록 위해 삭제동의메서드 실행
	public void delWorkspace_1(int workspace_id){
		String sql = "DELETE FROM workspace WHERE workspace_id = ?";
		//제약조건 걸어놔서 관련 문서, 멤버, 일정, 할일, 의사결정 등 모두 없어지게함
		
		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, workspace_id);//현재공간id
			pstmt.executeUpdate();
			DBConnection.pstmtClose(pstmt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		//소식 테이블에 전달   로그인중id
		//setNews(member_id, workspace_name + " 협업공간이 삭제되었습니다. 이 협업공간에 공유된 모든 문서 및 컨텐츠가 모두 삭제되었습니다.");
		
	}
}
