package com.one.dto;

public class WorkspaceFindManagerDto {
	private int member_id;
	private int private_fl;

	public WorkspaceFindManagerDto() {}
	public WorkspaceFindManagerDto(int member_id, int private_fl) {
		this.member_id = member_id;
		this.private_fl = private_fl;
	}
	
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getPrivate_fl() {
		return private_fl;
	}
	public void setPrivate_fl(int private_fl) {
		this.private_fl = private_fl;
	}
}
