package com.yr.dto;

import java.util.ArrayList;

public class HomeRecentDto {
	int workspace_id;
	private String workspasce_name;
	private String color;
	private ArrayList<String> pictures = new ArrayList<String>();
	private int count;
	public HomeRecentDto() {}
	public HomeRecentDto(int workspace_id, String workspasce_name, String color, ArrayList<String> pictures,
			int count) {
		super();
		this.workspace_id = workspace_id;
		this.workspasce_name = workspasce_name;
		this.color = color;
		this.pictures = pictures;
		this.count = count;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public String getWorkspasce_name() {
		return workspasce_name;
	}
	public void setWorkspasce_name(String workspasce_name) {
		this.workspasce_name = workspasce_name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public ArrayList<String> getPictures() {
		return pictures;
	}
	public void setPictures(ArrayList<String> pictures) {
		this.pictures = pictures;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	
	
}
