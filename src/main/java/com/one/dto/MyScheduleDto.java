package com.one.dto;

public class MyScheduleDto {
	private int workspace_id; 
	private int schedule_id;
	private int member_id;
	private String title;
	private String start_date;
	private String finish_date;

	
	public MyScheduleDto() {}
	public MyScheduleDto(int workspace_id, int schedule_id, int member_id, String title, String start_date, String finish_date) {
		this.workspace_id = workspace_id;
		this.schedule_id = schedule_id;
		this.member_id = member_id;
		this.title = title;
		this.start_date = start_date;
		this.finish_date = finish_date;
	}
	
	
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
