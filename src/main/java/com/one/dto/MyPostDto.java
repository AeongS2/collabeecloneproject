package com.one.dto;

public class MyPostDto {
	private String kanban_icon_p;
	private String title;
	private String workspace_name;
	private String date;
	
	public MyPostDto() {}
	public MyPostDto(String kanban_icon_p, String title, String workspace_name, String date) {
		super();
		this.kanban_icon_p = kanban_icon_p;
		this.title = title;
		this.workspace_name = workspace_name;
		this.date = date;
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
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}
