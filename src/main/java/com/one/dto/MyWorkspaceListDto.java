package com.one.dto;

public class MyWorkspaceListDto {
	private int workspace_id;
	private String workspace_name;
	private String color;
	private String summary;
	private String invite_url;
	private int confidential;
	private int complete;
	private String creation_date;
	private int workspace_alarm;
	
	public MyWorkspaceListDto() {}
	public MyWorkspaceListDto(int workspace_id, String workspace_name, String color, String summary, String invite_url,
			int confidential, int complete, String creation_date, int workspace_alarm) {
		super();
		this.workspace_id = workspace_id;
		this.workspace_name = workspace_name;
		this.color = color;
		this.summary = summary;
		this.invite_url = invite_url;
		this.confidential = confidential;
		this.complete = complete;
		this.creation_date = creation_date;
		this.workspace_alarm = workspace_alarm;
	}


	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
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
	public int getConfidential() {
		return confidential;
	}
	public void setConfidential(int confidential) {
		this.confidential = confidential;
	}
	public int getComplete() {
		return complete;
	}
	public void setComplete(int complete) {
		this.complete = complete;
	}
	public String getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}
	public int getWorkspace_alarm() {
		return workspace_alarm;
	}
	public void setWorkspace_alarm(int workspace_alarm) {
		this.workspace_alarm = workspace_alarm;
	}
	
	
}
