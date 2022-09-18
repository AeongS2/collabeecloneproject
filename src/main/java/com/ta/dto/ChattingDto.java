package com.ta.dto;

public class ChattingDto {
	private int chatting_room_id;
	private String chatting_name;
	public ChattingDto() {}
	public ChattingDto(int chatting_room_id, String chatting_name) {
		this.chatting_room_id = chatting_room_id;
		this.chatting_name = chatting_name;
	}
	public int getChatting_room_id() {
		return chatting_room_id;
	}
	public void setChatting_room_id(int chatting_room_id) {
		this.chatting_room_id = chatting_room_id;
	}
	public String getChatting_name() {
		return chatting_name;
	}
	public void setChatting_name(String chatting_name) {
		this.chatting_name = chatting_name;
	}
	
	
}
