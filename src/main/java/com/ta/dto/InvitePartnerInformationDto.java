package com.ta.dto;

public class InvitePartnerInformationDto {
	private int partner_id;
	private String invite_mail;
	public InvitePartnerInformationDto() {}
	public InvitePartnerInformationDto(int partner_id, String invite_mail) {
		this.partner_id = partner_id;
		this.invite_mail = invite_mail;
	}
	public int getPartner_id() {
		return partner_id;
	}
	public void setPartner_id(int partner_id) {
		this.partner_id = partner_id;
	}
	public String getInvite_mail() {
		return invite_mail;
	}
	public void setInvite_mail(String invite_mail) {
		this.invite_mail = invite_mail;
	}
	
}
