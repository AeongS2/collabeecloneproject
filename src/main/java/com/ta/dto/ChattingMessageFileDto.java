package com.ta.dto;

public class ChattingMessageFileDto {
	private String file_name;
	private String picture;
	public ChattingMessageFileDto() {}
	public ChattingMessageFileDto(String file_name, String picture) {
		this.file_name = file_name;
		this.picture = picture;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}
