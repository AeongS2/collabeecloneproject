package com.yr.dto;

public class CommentDto {
	private String picture;
	private String content;
	private String name;
	private String creation_date;
	private String comment;
	public CommentDto() {}
	public CommentDto(String picture, String content, String name, String creation_date, String comment) {
		super();
		this.picture = picture;
		this.content = content;
		this.name = name;
		this.creation_date = creation_date;
		this.comment = comment;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
}
