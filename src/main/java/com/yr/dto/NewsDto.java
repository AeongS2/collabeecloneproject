package com.yr.dto;

public class NewsDto {
	private String picture;
	private String name;
	private String content;
	private String creation_date;
	private int news_id;
	public NewsDto() {}
	public NewsDto(String picture, String name, String content, String creation_date, int news_id) {
		super();
		this.picture = picture;
		this.name = name;
		this.content = content;
		this.creation_date = creation_date;
		this.news_id = news_id;
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
	public String getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}
	public int getNews_id() {
		return news_id;
	}
	public void setNews_id(int news_id) {
		this.news_id = news_id;
	}
	
	
}
