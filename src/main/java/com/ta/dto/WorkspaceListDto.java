package com.ta.dto;

public class WorkspaceListDto {
	private int workspaceId;
	private String workspaceName;
	public WorkspaceListDto() {}
	public WorkspaceListDto(int workspaceId, String workspaceName) {
		this.workspaceId = workspaceId;
		this.workspaceName = workspaceName;
	}
	public int getWorkspaceId() {
		return workspaceId;
	}
	public void setWorkspaceId(int workspaceId) {
		this.workspaceId = workspaceId;
	}
	public String getWorkspaceName() {
		return workspaceName;
	}
	public void setWorkspaceName(String workspaceName) {
		this.workspaceName = workspaceName;
	}
	
}	
