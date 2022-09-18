package com.jm.dto;

public class TodoDetailDto {
	private int todo_id;
	private String todo_cur_p;
	private String content;
	private String start_date;
	private String finish_date;
	private String des;
	private String writer_name;
	private String writer_p;
	
	private String pic_name;
	private String pic_p;
	
	public TodoDetailDto() { }

	public TodoDetailDto(int todo_id, String todo_cur_p, String content, String start_date, String finish_date,
			String des, String writer_name, String writer_p, String pic_name, String pic_p) {
		super();
		this.todo_id = todo_id;
		this.todo_cur_p = todo_cur_p;
		this.content = content;
		this.start_date = start_date;
		this.finish_date = finish_date;
		this.des = des;
		this.writer_name = writer_name;
		this.writer_p = writer_p;
		this.pic_name = pic_name;
		this.pic_p = pic_p;
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

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}

	public String getWriter_name() {
		return writer_name;
	}

	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}

	public String getWriter_p() {
		return writer_p;
	}

	public void setWriter_p(String writer_p) {
		this.writer_p = writer_p;
	}

	public String getPic_name() {
		return pic_name;
	}

	public void setPic_name(String pic_name) {
		this.pic_name = pic_name;
	}

	public String getPic_p() {
		return pic_p;
	}

	public void setPic_p(String pic_p) {
		this.pic_p = pic_p;
	}

	
	
	
}
