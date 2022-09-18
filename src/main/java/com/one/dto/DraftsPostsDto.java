package com.one.dto;

public class DraftsPostsDto {
	private String k_icon_p;
	private int document_id;
	private String title;
	private String content;
	private String edit_date;
	private String workspace_name;
	private int workspace_id;
	
	public DraftsPostsDto() {}
	public DraftsPostsDto(String k_icon_p, int document_id, String title, String content, String edit_date, String workspace_name, int workspace_id) {
		this.k_icon_p = k_icon_p;
		this.document_id = document_id;
		this.title = title;
		this.content = content;
		this.edit_date = edit_date;
		this.workspace_name = workspace_name;
		this.workspace_id = workspace_id;
	}
	
	public String getK_icon_p() {
		return k_icon_p;
	}
	public void setK_icon_p(String k_icon_p) {
		this.k_icon_p = k_icon_p;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
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
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
}
