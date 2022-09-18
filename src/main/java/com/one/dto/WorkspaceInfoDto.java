package com.one.dto;

public class WorkspaceInfoDto {
	private String workspace_name;
	private String summary;

	public WorkspaceInfoDto(String workspace_name, String summary) {
		this.workspace_name = workspace_name;
		this.summary = summary;
	}
	
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
}
