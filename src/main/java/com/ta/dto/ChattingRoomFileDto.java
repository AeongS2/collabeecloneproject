package com.ta.dto;

public class ChattingRoomFileDto {
	private int file_id;
	private String file_name;
	private String file_date;
	private String picture;
	private String name;
	private String file_picture;
	public ChattingRoomFileDto() {}
	public ChattingRoomFileDto(int file_id, String file_name, String file_date, String picture, String name, String file_picture) {
		this.file_id = file_id;
		this.file_name = file_name;
		this.file_date = file_date;
		this.picture = picture;
		this.name = name;
		this.file_picture = file_picture;
	}
	public String getFile_picture() {
		return file_picture;
	}
	public void setFile_picture(String file_picture) {
		this.file_picture = file_picture;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}
