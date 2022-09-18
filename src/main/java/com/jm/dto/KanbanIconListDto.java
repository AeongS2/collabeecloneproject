package com.jm.dto;

public class KanbanIconListDto {
	private int kanban_icon_id;
	private String kanban_icon_p;
	
	KanbanIconListDto() { }

	public KanbanIconListDto(int kanban_icon_id, String kanban_icon_p) {
		super();
		this.kanban_icon_id = kanban_icon_id;
		this.kanban_icon_p = kanban_icon_p;
	}

	public int getKanban_icon_id() {
		return kanban_icon_id;
	}

	public void setKanban_icon_id(int kanban_icon_id) {
		this.kanban_icon_id = kanban_icon_id;
	}

	public String getKanban_icon_p() {
		return kanban_icon_p;
	}

	public void setKanban_icon_p(String kanban_icon_p) {
		this.kanban_icon_p = kanban_icon_p;
	}
	
	
}
