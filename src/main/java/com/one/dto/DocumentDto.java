package com.one.dto;

public class DocumentDto {
	private int document_id;
	private int writer_id;//작성자
	private int workspace_id; //저장된 공간
	private String title; 
	private String content;
	private String edit_date; 
	private int pic;//담당자
	private int drafts; //임시저장
	private int kanban_icon_id;

	
	public DocumentDto() {}
	public DocumentDto(int document_id, int writer_id, int workspace_id, String title, String content, String edit_date,
			int pic, int drafts, int kanban_icon_id) {
		this.document_id = document_id;
		this.writer_id = writer_id;
		this.workspace_id = workspace_id;
		this.title = title;
		this.content = content;
		this.edit_date = edit_date;
		this.pic = pic;
		this.drafts = drafts;
		this.kanban_icon_id = kanban_icon_id;
	}
	
	
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	public int getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(int writer_id) {
		this.writer_id = writer_id;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public int getPic() {
		return pic;
	}
	public void setPic(int pic) {
		this.pic = pic;
	}
	public int getDrafts() {
		return drafts;
	}
	public void setDrafts(int drafts) {
		this.drafts = drafts;
	}
	public int getKanban_icon_id() {
		return kanban_icon_id;
	}
	public void setKanban_icon_id(int kanban_icon_id) {
		this.kanban_icon_id = kanban_icon_id;
	}
}
