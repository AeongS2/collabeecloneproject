package com.one.dto;

public class NewWorkspaceDto {
	private String workspace_name; 
	private String color;
	private String summary;
	private String invite_url;
	private int member_id;
	
	public NewWorkspaceDto() {}
	public NewWorkspaceDto(String workspace_name, String color, String summary, String invite_url, int member_id) {
		super();
		this.workspace_name = workspace_name;
		this.color = color;
		this.summary = summary;
		this.invite_url = invite_url;
		this.member_id = member_id;
	}
	
	
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public String getInvite_url() {
		return invite_url;
	}
	public void setInvite_url(String invite_url) {
		this.invite_url = invite_url;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	
}
