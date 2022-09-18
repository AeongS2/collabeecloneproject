package com.ta.dto;

public class ChattingContentsDto {
	private int message_id;
	private String picture;
	private String name;
	private String message;
	private String send_time;
	private int file_id;
	private int link_id;
	public ChattingContentsDto() {}
	public ChattingContentsDto(int message_id, String picture, String name, String message, String send_time, int file_id, int link_id) {
		this.message_id = message_id;
		this.picture = picture;
		this.name = name;
		this.message = message;
		this.send_time = send_time;
		this.file_id = file_id;
		this.link_id = link_id;
	}
	public int getMessage_id() {
		return message_id;
	}
	public void setMessage_id(int message_id) {
		this.message_id = message_id;
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getSend_time() {
		return send_time;
	}
	public void setSend_time(String send_time) {
		this.send_time = send_time;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public int getLink_id() {
		return link_id;
	}
	public void setLink_id(int link_id) {
		this.link_id = link_id;
	}
	
}
