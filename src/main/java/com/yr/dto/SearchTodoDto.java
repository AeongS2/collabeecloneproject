package com.yr.dto;

public class SearchTodoDto {
	private String todo_cur_p;
	private String content;
	private String start_date;
	private String finish_date;
	private String workspace_name;
	private String title;
	private String name;
	private int todo_id;
	private int workspace_id;
	private int document_id;
	private String name2;
	public SearchTodoDto() {}
	public SearchTodoDto(String todo_cur_p, String content, String start_date, String finish_date,
			String workspace_name, String title, String name, int todo_id, int workspace_id, int document_id,
			String name2) {
		super();
		this.todo_cur_p = todo_cur_p;
		this.content = content;
		this.start_date = start_date;
		this.finish_date = finish_date;
		this.workspace_name = workspace_name;
		this.title = title;
		this.name = name;
		this.todo_id = todo_id;
		this.workspace_id = workspace_id;
		this.document_id = document_id;
		this.name2 = name2;
	}
	public String getTodo_cur_p() {
		return todo_cur_p;
	}
	public void setTodo_cur_p(String todo_cur_p) {
		this.todo_cur_p = todo_cur_p;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getFinish_date() {
		return finish_date;
	}
	public void setFinish_date(String finish_date) {
		this.finish_date = finish_date;
	}
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTodo_id() {
		return todo_id;
	}
	public void setTodo_id(int todo_id) {
		this.todo_id = todo_id;
	}
	public int getWorkspace_id() {
		return workspace_id;
	}
	public void setWorkspace_id(int workspace_id) {
		this.workspace_id = workspace_id;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	
	
}
