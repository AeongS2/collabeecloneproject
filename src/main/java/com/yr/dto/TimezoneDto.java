package com.yr.dto;

public class TimezoneDto {
	int timezone_id;
	String capital_name;
	String time;
	public TimezoneDto() {}
	public TimezoneDto(int timezone_id, String capital_name, String time) {
		super();
		this.timezone_id = timezone_id;
		this.capital_name = capital_name;
		this.time = time;
	}
	public int getTimezone_id() {
		return timezone_id;
	}
	public void setTimezone_id(int timezone_id) {
		this.timezone_id = timezone_id;
	}
	public String getCapital_name() {
		return capital_name;
	}
	public void setCapital_name(String capital_name) {
		this.capital_name = capital_name;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}
