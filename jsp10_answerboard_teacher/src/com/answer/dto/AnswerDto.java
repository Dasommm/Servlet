package com.answer.dto;

import java.util.Date;

public class AnswerDto {

	private int boardno;
	private int groupno;
	private int groupseq;
	private int titletab;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	
	public AnswerDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AnswerDto(int boardno, int groupno, int groupseq, int titletab, String title, String content, String writer,
			Date regdate) {
		super();
		this.boardno = boardno;
		this.groupno = groupno;
		this.groupseq = groupseq;
		this.titletab = titletab;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
	}
	public AnswerDto(String title, String content, String writer) {
		super();
		this.title = title;
		this.content = content;
		this.writer = writer;
	}
	public AnswerDto(int boardno, String title, String content) {
		super();
		this.boardno = boardno;
		this.title = title;
		this.content = content;
	}
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public int getGroupno() {
		return groupno;
	}
	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}
	public int getGroupseq() {
		return groupseq;
	}
	public void setGroupseq(int groupseq) {
		this.groupseq = groupseq;
	}
	public int getTitletab() {
		return titletab;
	}
	public void setTitletab(int titletab) {
		this.titletab = titletab;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
