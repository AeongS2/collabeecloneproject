package com.ta.dto;

public class InvitePartnerListDto {
	private int member_id;
	private String email;
	private String name;
	private String picture;
	public InvitePartnerListDto() {}
	public InvitePartnerListDto(int member_id, String email, String name, String picture) {
		this.member_id = member_id;
		this.email = email;
		this.name = name;
		this.picture = picture;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	
	
}
