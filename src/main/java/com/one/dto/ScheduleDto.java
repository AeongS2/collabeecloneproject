package com.one.dto;

public class ScheduleDto {
	private int schedule_id;
	private int workspace_id;
	private int writer_id;
	private String title;
	private String content;
	private int document_id;
	private String start_date;
	private String finish_date;
	private String locations;
	private String creation_date;
	private String edit_date;
	
	
	public ScheduleDto() {}
	public ScheduleDto(int schedule_id, int workspace_id, int writer_id, String title, String content, int document_id,
			String start_date, String finish_date, String locations, String creation_date, String edit_date) {
		this.schedule_id = schedule_id;
		this.workspace_id = workspace_id;
		this.writer_id = writer_id;
		this.title = title;
		this.content = content;
		this.document_id = document_id;
		this.start_date = start_date;
		this.finish_date = finish_date;
		this.locations = locations;
		this.creation_date = creation_date;
		this.edit_date = edit_date;
	}
	
	
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public int getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(int writer_id) {
		this.writer_id = writer_id;
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
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getFinish_date() {
		return finish_date;
	}
	public void setFinish_date(String finish_date) {
		this.finish_date = finish_date;
	}
	public String getLocations() {
		return locations;
	}
	public void setLocations(String locations) {
		this.locations = locations;
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
}
