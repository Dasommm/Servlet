package com.login.dto;

public class MbDto {
	
	private int mbno;
	private String mbid;
	private String mbpw;
	private String mbname;
	private String mbaddr;
	private String mbmobile;
	private String mbemail;
	private String mbenabled;
	private String mbroll;
	
	public MbDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MbDto(int mbno, String mbid, String mbpw, String mbname, String mbaddr, String mbmobile, String mbemail,
			String mbenabled, String mbroll) {
		super();
		this.mbno = mbno;
		this.mbid = mbid;
		this.mbpw = mbpw;
		this.mbname = mbname;
		this.mbaddr = mbaddr;
		this.mbmobile = mbmobile;
		this.mbemail = mbemail;
		this.mbenabled = mbenabled;
		this.mbroll = mbroll;
	}

	public int getMbno() {
		return mbno;
	}

	public void setMbno(int mbno) {
		this.mbno = mbno;
	}

	public String getMbid() {
		return mbid;
	}

	public void setMbid(String mbid) {
		this.mbid = mbid;
	}

	public String getMbpw() {
		return mbpw;
	}

	public void setMbpw(String mbpw) {
		this.mbpw = mbpw;
	}

	public String getMbname() {
		return mbname;
	}

	public void setMbname(String mbname) {
		this.mbname = mbname;
	}

	public String getMbaddr() {
		return mbaddr;
	}

	public void setMbaddr(String mbaddr) {
		this.mbaddr = mbaddr;
	}

	public String getMbmobile() {
		return mbmobile;
	}

	public void setMbmobile(String mbmobile) {
		this.mbmobile = mbmobile;
	}

	public String getMbemail() {
		return mbemail;
	}

	public void setMbemail(String mbemail) {
		this.mbemail = mbemail;
	}

	public String getMbenabled() {
		return mbenabled;
	}

	public void setMbenabled(String mbenabled) {
		this.mbenabled = mbenabled;
	}

	public String getMbroll() {
		return mbroll;
	}

	public void setMbroll(String mbroll) {
		this.mbroll = mbroll;
	}
	
	
	

}
