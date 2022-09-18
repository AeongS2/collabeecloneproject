package com.one.dto;

public class MemberInfoDto {
	private String picture;
	private int member_id;
	private String email;
	private String name;
	private String manager_icon_p;
	
	public MemberInfoDto() {}
	public MemberInfoDto(String picture,int member_id, String email, String name, String manager_icon_p) {
		super();
		this.picture = picture;
		this.member_id = member_id;
		this.email = email;
		this.name = name;
		this.manager_icon_p = manager_icon_p;
	}
	
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
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
	public String getManager_icon_p() {
		return manager_icon_p;
	}
	public void setManager_icon_p(String manager_icon_p) {
		this.manager_icon_p = manager_icon_p;
	}
	
}
