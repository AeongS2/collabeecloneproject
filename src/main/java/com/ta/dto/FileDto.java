package com.ta.dto;

public class FileDto {
	private String picture;
	private int file_id;
	private String workspace_name;
	private String file_name;
	public FileDto() {}
	public FileDto(String picture, int file_id, String workspace_name, String file_name) {
		this.picture = picture;
		this.file_id = file_id;
		this.workspace_name = workspace_name;
		this.file_name = file_name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
}
