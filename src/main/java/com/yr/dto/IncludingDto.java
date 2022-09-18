package com.yr.dto;

import java.util.ArrayList;

public class IncludingDto {
	private int document_id;
	private int writer_id;
	String writer_picture;
	ArrayList<DmBarDto> listDm;
	public IncludingDto() {}
	public IncludingDto(int document_id, int writer_id, String writer_picture, ArrayList<DmBarDto> listDm) {
		super();
		this.document_id = document_id;
		this.writer_id = writer_id;
		this.writer_picture = writer_picture;
		this.listDm = listDm;
	}
	public int getDocument_id() {
		return document_id;
	}
	public void setDocument_id(int document_id) {
		this.document_id = document_id;
	}
	public int getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(int writer_id) {
		this.writer_id = writer_id;
	}
	public String getWriter_picture() {
		return writer_picture;
	}
	public void setWriter_picture(String writer_picture) {
		this.writer_picture = writer_picture;
	}
	public ArrayList<DmBarDto> getListDm() {
		return listDm;
	}
	public void setListDm(ArrayList<DmBarDto> listDm) {
		this.listDm = listDm;
	}
	
}
