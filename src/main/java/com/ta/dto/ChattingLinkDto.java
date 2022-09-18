package com.ta.dto;

public class ChattingLinkDto {
	private int link_id;
	private String link_title;
	private String link_explanation;
	private String link_name;
	private String link_date;
	private String chatting_name;
	private String picture;
	public ChattingLinkDto() {}
	public ChattingLinkDto(int link_id, String link_title, String link_explanation, String link_name, String link_date,
			String chatting_name, String picture) {
		this.link_id = link_id;
		this.link_title = link_title;
		this.link_explanation = link_explanation;
		this.link_name = link_name;
		this.link_date = link_date;
		this.chatting_name = chatting_name;
		this.picture = picture;
	}
	public int getLink_id() {
		return link_id;
	}
	public void setLink_id(int link_id) {
		this.link_id = link_id;
	}
	public String getLink_title() {
		return link_title;
	}
	public void setLink_title(String link_title) {
		this.link_title = link_title;
	}
	public String getLink_explanation() {
		return link_explanation;
	}
	public void setLink_explanation(String link_explanation) {
		this.link_explanation = link_explanation;
	}
	public String getLink_name() {
		return link_name;
	}
	public void setLink_name(String link_name) {
		this.link_name = link_name;
	}
	public String getLink_date() {
		return link_date;
	}
	public void setLink_date(String link_date) {
		this.link_date = link_date;
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
