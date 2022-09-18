package com.one.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.one.dto.DocumentShowDto;

public class DocumentShowDao {//detail
	//문서 출력 
	
	 
	public ArrayList<DocumentShowDto> showDocument(int document_id) throws Exception {
		ArrayList<DocumentShowDto> list = new ArrayList<DocumentShowDto>();
		//제목과 내용, 문서알림,북마크 / 문서에 연결된 일정, 할일, 의결  / 협업공간과 협업공간 칸반리스트 
		String sql = "SELECT d.title, d.content, w.workspace_name, d.pic" + 
				" FROM document d, workspace w" + 
				" WHERE d.document_id = ? and d.workspace_id = w.workspace_id";
		Connection conn = DBConnection.getConnection();
		try {			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, document_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				String title = rs.getString("title");
				String content = rs.getString("content");
				String workspace_name = rs.getString("workspace_name");
				int pic = rs.getInt("pic");
				
				DocumentShowDto dto = new DocumentShowDto(title, content, workspace_name, pic); 
				list.add(dto);
			}
			DBConnection.getClose(pstmt, rs);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
