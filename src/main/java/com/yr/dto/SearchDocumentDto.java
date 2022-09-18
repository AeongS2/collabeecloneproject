package com.yr.dto;

public class SearchDocumentDto {
	private String title;
	private String workspace_name;
	private String name;
	private String edit_date;
	private int workspace_id;
	private int document_id;
	public SearchDocumentDto() {}
	public SearchDocumentDto(String title, String workspace_name, String name, String edit_date, int workspace_id,
			int document_id) {
		super();
		this.title = title;
		this.workspace_name = workspace_name;
		this.name = name;
		this.edit_date = edit_date;
		this.workspace_id = workspace_id;
		this.document_id = document_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	
}
