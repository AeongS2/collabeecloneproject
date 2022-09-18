package com.jm.dto;

public class PartnerListDto {
	private int member_id;
	private String picture;
	private String name;
	private String email;
	
	public PartnerListDto() { }

	public PartnerListDto(int member_id, String picture, String name, String email) {
		super();
		this.member_id = member_id;
		this.picture = picture;
		this.name = name;
		this.email = email;
	}

	public int getMember_id() {
		return member_id;
	}

	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	
}
