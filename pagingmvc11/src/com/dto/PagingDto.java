package com.dto;

public class PagingDto {

	private int totalcnt;  //전체 리스트 갯수
	private int startseq;  //리스트 처음 숫자
	private int endseq; //리스트 마지막 숫자
	private int understartnum;  //페이지 밑 시작숫자
	private int underendnum; //페이지 아래 마지막숫자
	private boolean prev;    //이전 화살표
	private boolean next;    //다음 화살표
	private int currentpage; //현재 보고 있는 페이지
	private int colnum = 10;  //페이지당 게시글 갯수
	
	public PagingDto() {
	
	}

	public PagingDto(int totalcnt, int startseq, int endseq, int understartnum, int underendnum, boolean prev,
			boolean next, int currentpage, int colnum) {
		super();
		this.totalcnt = totalcnt;
		this.startseq = startseq;
		this.endseq = endseq;
		this.understartnum = understartnum;
		this.underendnum = underendnum;
		this.prev = prev;
		this.next = next;
		this.currentpage = currentpage;
		this.colnum = colnum;
	}

	public int getTotalcnt() {
		return totalcnt;
	}

	public void setTotalcnt(int totalcnt) {
		this.totalcnt = totalcnt;
	}

	public int getStartseq() {
		return startseq;
	}

	public void setStartseq(int startseq) {
		this.startseq = startseq;
	}

	public int getEndseq() {
		return endseq;
	}

	public void setEndseq(int endseq) {
		this.endseq = endseq;
	}

	public int getUnderstartnum() {
		return understartnum;
	}

	public void setUnderstartnum(int understartnum) {
		this.understartnum = understartnum;
	}

	public int getUnderendnum() {
		return underendnum;
	}

	public void setUnderendnum(int underendnum) {
		this.underendnum = underendnum;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getCurrentpage() {
		return currentpage;
	}

	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}

	public int getColnum() {
		return colnum;
	}

	public void setColnum(int colnum) {
		this.colnum = colnum;
	}
	
	
}
