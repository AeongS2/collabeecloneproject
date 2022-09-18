package com.yr.dto;

public class NoneFolderDto {
	private int workspace_id;
	private String workspace_name;
	private String color;
	private int count;
	private int order;
	public NoneFolderDto() {}
	public NoneFolderDto(int workspace_id, String workspace_name, String color, int count, int order) {
		super();
		this.workspace_id = workspace_id;
		this.workspace_name = workspace_name;
		this.color = color;
		this.count = count;
		this.order = order;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getOrder() {
		return order;
	}
	public void setOrder(int order) {
		this.order = order;
	}
	
	
	
	
}
