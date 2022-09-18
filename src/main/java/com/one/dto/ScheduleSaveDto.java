package com.one.dto;

public class ScheduleSaveDto {
	private int workspace_id;
	private int writer_id;
	private String title;
	private String content;
	private String locations;
	private String start_date;
	private String finish_date;

	public ScheduleSaveDto() {}
	public ScheduleSaveDto(int workspace_id, int writer_id, String title, String content, String locations,
			String start_date, String finish_date) {
		this.workspace_id = workspace_id;
		this.writer_id = writer_id;
		this.title = title;
		this.content = content;
		this.locations = locations;
		this.start_date = start_date;
		this.finish_date = finish_date;
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
	public String getLocations() {
		return locations;
	}
	public void setLocations(String locations) {
		this.locations = locations;
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
}
