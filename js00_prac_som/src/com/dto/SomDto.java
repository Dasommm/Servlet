package com.dto;

import java.util.Date;

public class SomDto {
	
	private int snum;
	private String sname;
	private String stitle;
	private String scontent;
	private Date sdate;
	
	public SomDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SomDto(int snum, String sname, String stitle, String scontent, Date sdate) {
		super();
		this.snum = snum;
		this.sname = sname;
		this.stitle = stitle;
		this.scontent = scontent;
		this.sdate = sdate;
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getStitle() {
		return stitle;
	}

	public void setStitle(String stitle) {
		this.stitle = stitle;
	}

	public String getScontent() {
		return scontent;
	}

	public void setScontent(String scontent) {
		this.scontent = scontent;
	}

	public Date getSdate() {
		return sdate;
	}

	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	
	

}
