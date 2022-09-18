package com.yr.dto;

public class IssueDto {
	private String wname;
	private String picture;
	private String period;
	private String title;
	private String edit_date;
	private int id;
	private int sort;
	private String name2;
	private String name;
	public IssueDto() {}
	public IssueDto(String wname, String picture, String period, String title, String edit_date, int id, int sort,
			String name2, String name) {
		super();
		this.wname = wname;
		this.picture = picture;
		this.period = period;
		this.title = title;
		this.edit_date = edit_date;
		this.id = id;
		this.sort = sort;
		this.name2 = name2;
		this.name = name;
	}
	public String getWname() {
		return wname;
	}
	public void setWname(String wname) {
		this.wname = wname;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	
	
}
