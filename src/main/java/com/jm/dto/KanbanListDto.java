package com.jm.dto;

public class KanbanListDto {
	private String kanban_id;
	private String kanban_icon_p;
	private String kanban_name;
	private int kanban_order;
	private int kanban_docu_num;
	
	KanbanListDto() { }

	public KanbanListDto(String kanban_id, String kanban_icon_p, String kanban_name, int kanban_order,
			int kanban_docu_num) {
		super();
		this.kanban_id = kanban_id;
		this.kanban_icon_p = kanban_icon_p;
		this.kanban_name = kanban_name;
		this.kanban_order = kanban_order;
		this.kanban_docu_num = kanban_docu_num;
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

	public int getKanban_order() {
		return kanban_order;
	}

	public void setKanban_order(int kanban_order) {
		this.kanban_order = kanban_order;
	}

	public int getKanban_docu_num() {
		return kanban_docu_num;
	}

	public void setKanban_docu_num(int kanban_docu_num) {
		this.kanban_docu_num = kanban_docu_num;
	}
	
	
	
}
