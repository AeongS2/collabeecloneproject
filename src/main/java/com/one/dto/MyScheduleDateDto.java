package com.one.dto;

public class MyScheduleDateDto {
	private String start_date;
	private String finish_date;
	
	public MyScheduleDateDto() {}
	public MyScheduleDateDto(String start_date, String finish_date) {
		this.start_date = start_date;
		this.finish_date = finish_date;
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
