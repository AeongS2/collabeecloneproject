package com.one.dto;

public class WorkspaceMemberDto {
	private int workspace_mb_id;
	private int workspace_id;
	private int member_id;
	private int manager_id;
	private int workspace_alarm;
	private int private_fl; //프라이빗 공간 여부
	
	
	public WorkspaceMemberDto() {}
	public WorkspaceMemberDto(int workspace_mb_id, int workspace_id, int member_id, int manager_id, int workspace_alarm,
			int private_fl) {
		this.workspace_mb_id = workspace_mb_id;
		this.workspace_id = workspace_id;
		this.member_id = member_id;
		this.manager_id = manager_id;
		this.workspace_alarm = workspace_alarm;
		this.private_fl = private_fl;
	}
	
	
	public int getWorkspace_mb_id() {
		return workspace_mb_id;
	}
	public void setWorkspace_mb_id(int workspace_mb_id) {
		this.workspace_mb_id = workspace_mb_id;
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
	public int getManager_id() {
		return manager_id;
	}
	public void setManager_id(int manager_id) {
		this.manager_id = manager_id;
	}
	public int getWorkspace_alarm() {
		return workspace_alarm;
	}
	public void setWorkspace_alarm(int workspace_alarm) {
		this.workspace_alarm = workspace_alarm;
	}
	public int getPrivate_fl() {
		return private_fl;
	}
	public void setPrivate_fl(int private_fl) {
		this.private_fl = private_fl;
	}
	
	
}
