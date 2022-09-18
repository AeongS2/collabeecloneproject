package com.one.dto;

public class WorkspacePostListDto {
	private String name;
	private String kanban_icon_p;
	private String title;
	private String creation_date;
	private String edit_date;
	private int document_id;
	
	public WorkspacePostListDto() {}
	public WorkspacePostListDto(String name, String kanban_icon_p, String title, String creation_date, String edit_date, int document_id) {
		this.name = name;
		this.kanban_icon_p = kanban_icon_p;
		this.title = title;
		this.creation_date = creation_date;
		this.document_id = document_id;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getKanban_icon_p() {
		return kanban_icon_p;
	}
	public void setKanban_icon_p(String kanban_icon_p) {
		this.kanban_icon_p = kanban_icon_p;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}

	
	
}	
