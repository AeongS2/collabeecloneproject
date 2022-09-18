package com.yr.dto;

public class CollabeenewinfoDto {
	String title;
	String content;
	String creation_date;
	public CollabeenewinfoDto() {}
	public CollabeenewinfoDto(String title, String content, String creation_date) {
		super();
		this.title = title;
		this.content = content;
		this.creation_date = creation_date;
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
	public String getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}
	
}
