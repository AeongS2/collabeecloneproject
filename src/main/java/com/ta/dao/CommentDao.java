package com.ta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ta.dto.CommentDto;
import com.ta.dto.ReplyCommentDto;

public class CommentDao {
	public ArrayList<CommentDto> getComment(int documentId){
		ArrayList<CommentDto> list = new ArrayList<CommentDto>(); 
		try {
			String sql = "SELECT c.comment_id ,m.picture, m.name, TO_CHAR(c.creation_date,'mm\"월\" dd\"일\" am hh:mi') AS creation_date, c.content " + 
					"FROM comments c, member m " + 
					"WHERE m.member_id = c.comment_writer " + 
					"AND c.document_id = ? " + 
					"ORDER BY c.creation_date ASC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, documentId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int comment_id = rs.getInt("comment_id");
				String picture = rs.getString("picture");
				String name = rs.getString("name");
				String creation_date = rs.getString("creation_date");
				String content = rs.getString("content");
				list.add(new CommentDto(comment_id,picture,name,creation_date,content));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	public int getCountReplyComment(int comment_id) {
		int countReplyComment=0;
		try {
			String sql = "SELECT COUNT(reply_comment_id) " +   
					"FROM reply_comment " + 
					"WHERE comment_id = ? " ;
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment_id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				countReplyComment = rs.getInt("COUNT(reply_comment_id)");
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return countReplyComment;
	}
	public ArrayList<ReplyCommentDto> getReplyComment(int documentId, int commentId){
		ArrayList<ReplyCommentDto> list = new ArrayList<ReplyCommentDto>();
		try {
			String sql = "SELECT rc.reply_comment_id ,c.content, m.picture, m.name, TO_CHAR(rc.reply_creation_date,'mm\"월\" dd\"일\" am hh:mi') AS creation_date, rc.reply_content " + 
					"FROM comments c, reply_comment rc, member m " + 
					"WHERE m.member_id = c.comment_writer " + 
					"AND c.comment_id = rc.comment_id " + 
					"AND c.document_id = ? " + 
					"AND c.comment_id = ? " + 
					"ORDER BY c.creation_date ASC";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, documentId);
			pstmt.setInt(2, commentId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int reply_comment_id = rs.getInt("reply_comment_id");
				String parentContent = rs.getString("content");
				String writerPicture = rs.getString("picture");
				String writerName = rs.getString("name");
				String replyCreationDate = rs.getString("creation_date");
				String replyContent = rs.getString("reply_content");
				list.add(new ReplyCommentDto(reply_comment_id,parentContent,writerPicture,writerName,replyCreationDate,replyContent));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	public ArrayList<CommentDto> getClickCommentView(int documentId){
		ArrayList<CommentDto> list = new ArrayList<CommentDto>();
		try {
			String sql = "SELECT c.comment_id, m.picture, m.name, TO_CHAR(c.creation_date,'mm\"월\" dd\"일\" am hh:mi') AS creation_date, c.content " + 
					"FROM comments c, member m " + 
					"WHERE m.member_id = c.comment_writer " + 
					"AND c.document_id = ? " + 
					"AND c.fixed_comment = 0 " + 
					"ORDER BY c.creation_date ASC ";
			Connection conn = DBConnection.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, documentId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int comment_id = rs.getInt("comment_id");
				String picture = rs.getString("picture");
				String name = rs.getString("name");
				String creation_date = rs.getString("creation_date");
				String content = rs.getString("content");
				list.add(new CommentDto(comment_id, picture, name, creation_date, content));
			}
			rs.close();
			pstmt.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}	
	public void insertComments(int loginId, int documentId, String content) { // 파일이 없는 댓글 저장  
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO comments VALUES (comment_id.nextval, ?, ?, sysdate, ? , null, 0)";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, loginId);
			pstmt.setInt(2, documentId);
			pstmt.setString(3, content);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void insertReplyComments(int commentId, String replyContent, int loginId) { // 파일이 없는 대댓글 저장 
		PreparedStatement pstmt = null;
		try {
			String sql = "INSERT INTO reply_comment VALUES (reply_comment_id.nextval, ?, ?, sysdate, ?, null )";
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentId);
			pstmt.setString(2, replyContent);
			pstmt.setInt(3, loginId);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void deleteComment(int commentId) { // 댓글 삭제
		PreparedStatement pstmt = null;
		try {
			String sql = "UPDATE comments SET content = '댓글이 삭제되었습니다.' " + 
					"WHERE comment_id = ?"; 
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentId);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public void deleteReplyComment(int replyCommentId) {
		PreparedStatement pstmt = null;
		try {
			String sql = "DELETE FROM reply_comment " + 
					"WHERE reply_comment_id = ? "; 
			Connection conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, replyCommentId);
			pstmt.executeUpdate();
			pstmt.close();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
