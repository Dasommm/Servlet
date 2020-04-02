package com.board.dto;

import java.sql.Date;

public class BoardDto {
	
	private int seq;
	private String name;
	private String title;
	private String content;
	private Date regdate;
	
	public BoardDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BoardDto(int seq, String name, String title, String content, Date regdate) {
		super();
		this.seq = seq;
		this.name = name;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	

}
