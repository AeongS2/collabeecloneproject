package com.jm.dto;

public class KanbanDocuDto {
	private int document_id;
	private String title;
	private int kanban_do_order;
	
	public KanbanDocuDto() { }

	public KanbanDocuDto(int document_id, String title, int kanban_do_order) {
		super();
		this.document_id = document_id;
		this.title = title;
		this.kanban_do_order = kanban_do_order;
	}

	public int getDocument_id() {
		return document_id;
	}

	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getKanban_do_order() {
		return kanban_do_order;
	}

	public void setKanban_do_order(int kanban_do_order) {
		this.kanban_do_order = kanban_do_order;
	}
	
	
}
