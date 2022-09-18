package com.ta.dto;

public class RecentlyImgOrFileDto {
	private int file_id;
	private String file_name;
	public RecentlyImgOrFileDto() {}
	public RecentlyImgOrFileDto(int file_id, String file_name) {
		this.file_id = file_id;
		this.file_name = file_name;
	}
	public int getFile_id() {
		return file_id;
	}
	public void setFile_id(int file_id) {
		this.file_id = file_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
}
