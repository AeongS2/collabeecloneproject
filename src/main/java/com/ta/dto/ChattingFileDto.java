package com.ta.dto;

public class ChattingFileDto {
	private int file_id;
	private String file_name;
	private String file_date;
	private String chatting_name;
	private String picture;
	public ChattingFileDto() {}
	public ChattingFileDto(int file_id, String file_name, String file_date, String chatting_name, String picture) {
		this.file_id = file_id;
		this.file_name = file_name;
		this.file_date = file_date;
		this.chatting_name = chatting_name;
		this.picture = picture;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_date() {
		return file_date;
	}
	public void setFile_date(String file_date) {
		this.file_date = file_date;
	}
	public String getChatting_name() {
		return chatting_name;
	}
	public void setChatting_name(String chatting_name) {
		this.chatting_name = chatting_name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}
