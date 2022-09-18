package com.yr.dto;

public class SearchCommentsDto {
	private String picture;
	private String name;
	private String content;
	private String workspace_name;
	private String title;
	private int workspace_id;
	private int document_id;
	private String creation_date;
	public SearchCommentsDto() {}
	public SearchCommentsDto(String picture, String name, String content, String workspace_name, String title,
			int workspace_id, int document_id, String creation_date) {
		super();
		this.picture = picture;
		this.name = name;
		this.content = content;
		this.workspace_name = workspace_name;
		this.title = title;
		this.workspace_id = workspace_id;
		this.document_id = document_id;
		this.creation_date = creation_date;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}
	
	
}
