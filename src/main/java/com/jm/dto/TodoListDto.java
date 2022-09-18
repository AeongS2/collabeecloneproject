package com.jm.dto;

public class TodoListDto {
	private int todo_id;
	private String todo_cur_p;
	private String content;
	private String date;
	private String workspace_name;
	private String writer_p;
	private String pic_p;
	
	public TodoListDto() { }

	public TodoListDto(int todo_id, String todo_cur_p, String content, String date, String workspace_name,
			String writer_p, String pic_p) {
		super();
		this.todo_id = todo_id;
		this.todo_cur_p = todo_cur_p;
		this.content = content;
		this.date = date;
		this.workspace_name = workspace_name;
		this.writer_p = writer_p;
		this.pic_p = pic_p;
	}
	
	public TodoListDto(int todo_id, String todo_cur_p, String content, String writer_p) {
		super();
		this.todo_id = todo_id;
		this.todo_cur_p = todo_cur_p;
		this.content = content;
		this.writer_p = writer_p;
	}

	public int getTodo_id() {
		return todo_id;
	}

	public void setTodo_id(int todo_id) {
		this.todo_id = todo_id;
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

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWorkspace_name() {
		return workspace_name;
	}

	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}

	public String getWriter_p() {
		return writer_p;
	}

	public void setWriter_p(String writer_p) {
		this.writer_p = writer_p;
	}

	public String getPic_p() {
		return pic_p;
	}

	public void setPic_p(String pic_p) {
		this.pic_p = pic_p;
	}
	
}
