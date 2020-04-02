package com.dto;

import java.util.Date;

public class MyDto {
	//데이터 베이스들의 이름들과 동일하게 만들자
	
	private int myNo;
	private String myName;
	private String myTitle;
	private String myContent;
	private Date myDate;
	
	
	//기본생성자
	public MyDto() {
		super();
	}

	//파라미터 값 받는 생성자
	public MyDto(int myNo, String myName, String myTitle, String myContent, Date myDate) {
		this.myNo = myNo;
		this.myName = myName;
		this.myTitle = myTitle;
		this.myContent = myContent;
		this.myDate = myDate;
	}

	//getter & setter 
	public int getMyNo() {
		return myNo;
	}


	public void setMyNo(int myNo) {
		this.myNo = myNo;
	}


	public String getMyName() {
		return myName;
	}


	public void setMyName(String myName) {
		this.myName = myName;
	}


	public String getMyTitle() {
		return myTitle;
	}


	public void setMyTitle(String myTitle) {
		this.myTitle = myTitle;
	}


	public String getMyContent() {
		return myContent;
	}


	public void setMyContent(String myContent) {
		this.myContent = myContent;
	}


	public Date getMyDate() {
		return myDate;
	}


	public void setMyDate(Date myDate) {
		this.myDate = myDate;
	}		
	
}



