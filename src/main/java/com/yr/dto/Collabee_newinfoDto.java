package com.yr.dto;

public class Collabee_newinfoDto {
	private int collabee_newinfo_id;
	private String title;
	private String content;
	private String creation_date;
	public Collabee_newinfoDto() {}
	public Collabee_newinfoDto(int collabee_newinfo_id, String title, String content, String creation_date) {
		super();
		this.collabee_newinfo_id = collabee_newinfo_id;
		this.title = title;
		this.content = content;
		this.creation_date = creation_date;
	}
	public int getCollabee_newinfo_id() {
		return collabee_newinfo_id;
	}
	public void setCollabee_newinfo_id(int collabee_newinfo_id) {
		this.collabee_newinfo_id = collabee_newinfo_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	
	
}
