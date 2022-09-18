package com.one.dto;

public class WorkspaceDelDto {
	private int workspace_del_id;
	private int workspace_id;
	private String workspace_name;
	private int manager_id;
	private String manager_name;
	private int del_fl; //삭제동의 여부
	private String del_time; //삭제한 시간
	
	public WorkspaceDelDto() {}
	public WorkspaceDelDto(int workspace_del_id, int workspace_id, String workspace_name, int manager_id,
			String manager_name, int del_fl, String del_time) {
		this.workspace_del_id = workspace_del_id;
		this.workspace_id = workspace_id;
		this.workspace_name = workspace_name;
		this.manager_id = manager_id;
		this.manager_name = manager_name;
		this.del_fl = del_fl;
		this.del_time = del_time;
	}
	
	
	public int getWorkspace_del_id() {
		return workspace_del_id;
	}
	public void setWorkspace_del_id(int workspace_del_id) {
		this.workspace_del_id = workspace_del_id;
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
	public int getManager_id() {
		return manager_id;
	}
	public void setManager_id(int manager_id) {
		this.manager_id = manager_id;
	}
	public String getManager_name() {
		return manager_name;
	}
	public void setManager_name(String manager_name) {
		this.manager_name = manager_name;
	}
	public int getDel_fl() {
		return del_fl;
	}
	public void setDel_fl(int del_fl) {
		this.del_fl = del_fl;
	}
	public String getDel_time() {
		return del_time;
	}
	public void setDel_time(String del_time) {
		this.del_time = del_time;
	}
	
}
