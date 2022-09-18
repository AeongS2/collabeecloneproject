package com.one.dto;

public class Member_Dto {
	private int member_id;
	private String email;
	private String pw;
	private String name;
	private int corporation_id;
	private int corporation_manager;
	private String picture;
	
	
	public Member_Dto() { }
	public Member_Dto(int member_id, String email, String pw, String name, int corporation_id, int corporation_manager,
			String picture) {
		this.member_id = member_id;
		this.email = email;
		this.pw = pw;
		this.name = name;
		this.corporation_id = corporation_id;
		this.corporation_manager = corporation_manager;
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
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCorporation_id() {
		return corporation_id;
	}
	public void setCorporation_id(int corporation_id) {
		this.corporation_id = corporation_id;
	}
	public int getCorporation_manager() {
		return corporation_manager;
	}
	public void setCorporation_manager(int corporation_manager) {
		this.corporation_manager = corporation_manager;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	
}
