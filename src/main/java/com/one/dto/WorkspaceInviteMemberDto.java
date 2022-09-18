package com.one.dto;

public class WorkspaceInviteMemberDto {
	private int workspace_id; 
	private int member_id;
	public WorkspaceInviteMemberDto(int workspace_id, int member_id) {
		this.workspace_id = workspace_id;
		this.member_id = member_id;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
}
