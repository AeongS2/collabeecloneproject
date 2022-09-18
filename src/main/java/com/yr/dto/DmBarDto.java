package com.yr.dto;

public class DmBarDto {
	private String decision_icon_p;
	private String decision_making_title;
	private String decision_making_cur;
	private String picture1;
	private String workspace_name;
	private String title;
	private int decision;
	private int document_id;
	private String name;
	private String edit_date;
	private int workspace_id;
	public DmBarDto() {}
	public DmBarDto(String decision_icon_p, String decision_making_title, String decision_making_cur, String picture1,
			String workspace_name, String title, int decision, int document_id, String name, String edit_date,
			int workspace_id) {
		super();
		this.decision_icon_p = decision_icon_p;
		this.decision_making_title = decision_making_title;
		this.decision_making_cur = decision_making_cur;
		this.picture1 = picture1;
		this.workspace_name = workspace_name;
		this.title = title;
		this.decision = decision;
		this.document_id = document_id;
		this.name = name;
		this.edit_date = edit_date;
		this.workspace_id = workspace_id;
	}
	public String getDecision_icon_p() {
		return decision_icon_p;
	}
	public void setDecision_icon_p(String decision_icon_p) {
		this.decision_icon_p = decision_icon_p;
	}
	public String getDecision_making_title() {
		return decision_making_title;
	}
	public void setDecision_making_title(String decision_making_title) {
		this.decision_making_title = decision_making_title;
	}
	public String getDecision_making_cur() {
		return decision_making_cur;
	}
	public void setDecision_making_cur(String decision_making_cur) {
		this.decision_making_cur = decision_making_cur;
	}
	public String getPicture1() {
		return picture1;
	}
	public void setPicture1(String picture1) {
		this.picture1 = picture1;
	}
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getDecision() {
		return decision;
	}
	public void setDecision(int decision) {
		this.decision = decision;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEdit_date() {
		return edit_date;
	}
	public void setEdit_date(String edit_date) {
		this.edit_date = edit_date;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	
	
}
