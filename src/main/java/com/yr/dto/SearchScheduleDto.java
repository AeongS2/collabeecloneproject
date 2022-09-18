package com.yr.dto;

public class SearchScheduleDto {
	private String date;
	private String title;
	private String color;
	private String name;
	private int schedule_id;
	private int count;
	public SearchScheduleDto() {}
	public SearchScheduleDto(String date, String title, String color, String name, int schedule_id, int count) {
		super();
		this.date = date;
		this.title = title;
		this.color = color;
		this.name = name;
		this.schedule_id = schedule_id;
		this.count = count;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
}
