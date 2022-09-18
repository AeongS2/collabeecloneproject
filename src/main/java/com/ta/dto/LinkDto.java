package com.ta.dto;

public class LinkDto {
	private String linkPicture;
	private int link_id;
	private String workspace_name;
	private String title;
	private String link_name;
	private String link_title;
	private String link_explanation;
	private String picture;
	public LinkDto() {}
	public LinkDto(String linkPicture, int link_id, String workspace_name, String title, String link_name,
			String link_title, String link_explanation, String picture) {
		this.linkPicture = linkPicture;
		this.link_id = link_id;
		this.workspace_name = workspace_name;
		this.title = title;
		this.link_name = link_name;
		this.link_title = link_title;
		this.link_explanation = link_explanation;
		this.picture = picture;
	}
	public String getLinkPicture() {
		return linkPicture;
	}
	public void setLinkPicture(String linkPicture) {
		this.linkPicture = linkPicture;
	}
	public int getLink_id() {
		return link_id;
	}
	public void setLink_id(int link_id) {
		this.link_id = link_id;
	}
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
