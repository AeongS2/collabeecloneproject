package com.one.dto;

public class DocumentShowDto {
	private String title;
	private String content;
	private String workspace_name;
	private int pic;
	
	public DocumentShowDto() {}
	public DocumentShowDto(String title, String content, String workspace_name, int pic) {
		this.title = title;
		this.content = content;
		this.workspace_name = workspace_name;
		this.pic = pic;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWorkspace_name() {
		return workspace_name;
	}
	public void setWorkspace_name(String workspace_name) {
		this.workspace_name = workspace_name;
	}
	public int getPic() {
		return pic;
	}
	public void setPic(int pic) {
		this.pic = pic;
	}
}
