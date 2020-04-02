package com.answer.dto;

import java.sql.Date;

public class AnsDto {

	private int bdno;
	private int gno;
	private int gseq;
	private int ttab;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private String enbdelete;
	
	
	public AnsDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public AnsDto(int bdno, int gno, int gseq, int ttab, String title, String content, String writer, Date regdate,
			String enbdelete) {
		super();
		this.bdno = bdno;
		this.gno = gno;
		this.gseq = gseq;
		this.ttab = ttab;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.regdate = regdate;
		this.enbdelete = enbdelete;
	}


	public int getBdno() {
		return bdno;
	}


	public void setBdno(int bdno) {
		this.bdno = bdno;
	}


	public int getGno() {
		return gno;
	}


	public void setGno(int gno) {
		this.gno = gno;
	}


	public int getGseq() {
		return gseq;
	}


	public void setGseq(int gseq) {
		this.gseq = gseq;
	}


	public int getTtab() {
		return ttab;
	}


	public void setTtab(int ttab) {
		this.ttab = ttab;
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


	public String getEnbdelete() {
		return enbdelete;
	}


	public void setEnbdelete(String enbdelete) {
		this.enbdelete = enbdelete;
	}

	
	
	
	
}
