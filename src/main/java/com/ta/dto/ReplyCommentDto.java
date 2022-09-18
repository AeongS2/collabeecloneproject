package com.ta.dto;

public class ReplyCommentDto {
	private int reply_comment_id;
	private String parentCContent;
	private String writerPicture;
	private String writerName;
	private String replyCreationDate;
	private String replyContent;
	public ReplyCommentDto() {}
	public ReplyCommentDto(int reply_comment_id, String parentCContent, String writerPicture, String writerName,
			String replyCreationDate, String replyContent) {
		this.reply_comment_id = reply_comment_id;
		this.parentCContent = parentCContent;
		this.writerPicture = writerPicture;
		this.writerName = writerName;
		this.replyCreationDate = replyCreationDate;
		this.replyContent = replyContent;
	}
	public int getReply_comment_id() {
		return reply_comment_id;
	}
	public void setReply_comment_id(int reply_comment_id) {
		this.reply_comment_id = reply_comment_id;
	}
	public String getParentCContent() {
		return parentCContent;
	}
	public void setParentCContent(String parentCContent) {
		this.parentCContent = parentCContent;
	}
	public String getWriterPicture() {
		return writerPicture;
	}
	public void setWriterPicture(String writerPicture) {
		this.writerPicture = writerPicture;
	}
	public String getWriterName() {
		return writerName;
	}
	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}
	public String getReplyCreationDate() {
		return replyCreationDate;
	}
	public void setReplyCreationDate(String replyCreationDate) {
		this.replyCreationDate = replyCreationDate;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	
}
