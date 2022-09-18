package com.one.dto;

public class PaymentDto {
	private int payment_id;
	private int member_id; //결제한 사람
	private String version; //B or E
	private String payment_date;//결제일
	private String pay_term;//M or Y 
	private String finish_date;
	private int workspace_id; //해당 회사의 모두의 공간
	
	
	public PaymentDto() {}
	public PaymentDto(int payment_id, int member_id, String version, String payment_date, String pay_term,
			String finish_date, int workspace_id) {
		this.payment_id = payment_id;
		this.member_id = member_id;
		this.version = version;
		this.payment_date = payment_date;
		this.pay_term = pay_term;
		this.finish_date = finish_date;
		this.workspace_id = workspace_id;
	}
	
	
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public String getPay_term() {
		return pay_term;
	}
	public void setPay_term(String pay_term) {
		this.pay_term = pay_term;
	}
	public String getFinish_date() {
		return finish_date;
	}
	public void setFinish_date(String finish_date) {
		this.finish_date = finish_date;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	
	
}
