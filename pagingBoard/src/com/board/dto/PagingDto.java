package com.board.dto;

public class PagingDto {

	private int totalrows;	//총 게시글 수
	private int currentpage;	//현재 보고 있는 페이지
	private int pagescale;	//한번에 보고자 하는 페이지의 양. 한번에 1-5까지 보고싶다면 pagescale은 5
	private int startpage;	//시작페이지 ex) 1-5까지의 페이지가 한번에 보인다면 startpage는 1
	private int endpage;	//마지막페이지  ex) 1-5까지의 페이지가 한번에 보인다면 endpage는 5
	private int pagegroup;	//한번에 묶이는 페이지그룹 ex) 5페이지씩 표현이 된다면 1-5가 페이지그룹 1, 6-10이 페이지그룹 2
	private int totalpage;	//총 페이지 수. 내가 가지고 있는 총 게시글로 표시할 수 있는 마지막 page번호
	
	private int to;
	private int from;
	
	public PagingDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PagingDto(int totalrows, int currentpage, int pagescale, int startpage, int endpage, int pagegroup,
			int totalpage) {
		super();
		this.totalrows = totalrows;
		this.currentpage = currentpage;
		this.pagescale = pagescale;
		this.startpage = startpage;
		this.endpage = endpage;
		this.pagegroup = pagegroup;
		this.totalpage = totalpage;
	}
	public int getTotalrows() {
		return totalrows;
	}
	public void setTotalrows(int totalrows) {
		this.totalrows = totalrows;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getPagescale() {
		return pagescale;
	}
	public void setPagescale(int pagescale) {
		this.pagescale = pagescale;
	}
	public int getStartpage() {
		return startpage;
	}
	public void setStartpage(int startpage) {
		this.startpage = startpage;
	}
	public int getEndpage() {
		return endpage;
	}
	public void setEndpage(int endpage) {
		this.endpage = endpage;
	}
	public int getPagegroup() {
		return pagegroup;
	}
	public void setPagegroup(int pagegroup) {
		this.pagegroup = pagegroup;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	public int getTo() {
		return to;
	}
	public void setTo(int to) {
		this.to = to;
	}
	public int getFrom() {
		return from;
	}
	public void setFrom(int from) {
		this.from = from;
	}
	
	
}