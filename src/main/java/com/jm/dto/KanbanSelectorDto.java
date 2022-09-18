package com.jm.dto;

public class KanbanSelectorDto {
	private String kanban_id;
	private String kanban_icon_p;
	private String kanban_name;
	
	public KanbanSelectorDto() { }

	public KanbanSelectorDto(String kanban_id, String kanban_icon_p, String kanban_name) {
		super();
		this.kanban_id = kanban_id;
		this.kanban_icon_p = kanban_icon_p;
		this.kanban_name = kanban_name;
	}

	public String getKanban_id() {
		return kanban_id;
	}

	public void setKanban_id(String kanban_id) {
		this.kanban_id = kanban_id;
	}

	public String getKanban_icon_p() {
		return kanban_icon_p;
	}

	public void setKanban_icon_p(String kanban_icon_p) {
		this.kanban_icon_p = kanban_icon_p;
	}

	public String getKanban_name() {
		return kanban_name;
	}

	public void setKanban_name(String kanban_name) {
		this.kanban_name = kanban_name;
	}

	
	
}
