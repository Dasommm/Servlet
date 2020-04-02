package com.mvc.dto;

import java.sql.Date;

public class MyDto {

	private int seq;
	private String writer;
	private String title;
	private String content;
	private Date regdate;
	
	public MyDto(int seq, String writer, String title, String content, Date regdate) {
		super();
		this.seq = seq;
		this.writer = writer;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	
	//insert
	public MyDto(String writer, String title, String content) {
		this.writer=writer;
		this.title=title;
		this.content=content;
	}
	
	//update
	public MyDto(String title, String content) {
		this.title=title;
		this.content=content;
	}
	
	public MyDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
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
