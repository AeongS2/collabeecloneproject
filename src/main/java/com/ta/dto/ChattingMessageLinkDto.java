package com.ta.dto;

public class ChattingMessageLinkDto {
	private String link_name;
	private String link_title;
	private String link_explanation;
	private String picture;
	public ChattingMessageLinkDto() {}
	public ChattingMessageLinkDto(String link_name, String link_title, String link_explanation, String picture) {
		this.link_name = link_name;
		this.link_title = link_title;
		this.link_explanation = link_explanation;
		this.picture = picture;
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
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}
