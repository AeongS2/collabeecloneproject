package com.ta.dto;

public class ChattingRoomLinkDto {
	private int link_id;
	private String link_picture;
	private String link_name;
	private String link_title;
	private String link_explanation;
	private String link_date;
	private String name;
	private String picture;
	public ChattingRoomLinkDto() {}
	public ChattingRoomLinkDto(int link_id,String link_picture, String link_name, String link_title, String link_explanation,
			String link_date, String name, String picture) {
		this.link_id = link_id;
		this.link_picture = link_picture;
		this.link_name = link_name;
		this.link_title = link_title;
		this.link_explanation = link_explanation;
		this.link_date = link_date;
		this.name = name;
		this.picture = picture;
	}
	public int getLink_id() {
		return link_id;
	}
	public void setLink_id(int link_id) {
		this.link_id = link_id;
	}
	public String getLink_picture() {
		return link_picture;
	}
	public void setLink_picture(String link_picture) {
		this.link_picture = link_picture;
	}
	public String getLink_name() {
		return link_name;
	}
	public void setLink_name(String link_name) {
		this.link_name = link_name;
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
	public String getLink_date() {
		return link_date;
	}
	public void setLink_date(String link_date) {
		this.link_date = link_date;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}
