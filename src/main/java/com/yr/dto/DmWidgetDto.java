package com.yr.dto;

public class DmWidgetDto {
	private String decision_icon_p;
	private String decision_making_title;
	private String name;
	private int document_id;
	public DmWidgetDto() {}
	public DmWidgetDto(String decision_icon_p, String decision_making_title, String name, int document_id) {
		super();
		this.decision_icon_p = decision_icon_p;
		this.decision_making_title = decision_making_title;
		this.name = name;
		this.document_id = document_id;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	
	
}
