package com.one.dto;

public class WorkspaceDto {
	
	private int workspace_id;
	private String workspace_name;
	private String color; //협업공간 색
	private String summary; //협업공간 설명
	private String invite_url; //협업공간 주소
	private int confidential; //협업공간 대외비
	private int complete; //협업공간 완료
	private String creation_date; //생성일자
	
	
	public WorkspaceDto() {}
	public WorkspaceDto(int workspace_id, String workspace_name, String color, String summary, String invite_url,
			int confidential, int complete, String creation_date) {
		this.workspace_id = workspace_id;
		this.workspace_name = workspace_name;
		this.color = color;
		this.summary = summary;
		this.invite_url = invite_url;
		this.confidential = confidential;
		this.complete = complete;
		this.creation_date = creation_date;
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
	
	
	
	
}
