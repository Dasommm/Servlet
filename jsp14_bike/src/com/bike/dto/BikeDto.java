package com.bike.dto;

public class BikeDto {

	private String addrGu;
	private int contentId;
	private String contentNum;
	private String newAddr;
	private int cradleCount;
	private double longitude;
	private double latitude;
	
	public BikeDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BikeDto(String addrGu, int contentId, String contentNum, String newAddr, int cradleCount, double longitude,
			double latitude) {
		super();
		this.addrGu = addrGu;
		this.contentId = contentId;
		this.contentNum = contentNum;
		this.newAddr = newAddr;
		this.cradleCount = cradleCount;
		this.longitude = longitude;
		this.latitude = latitude;
	}

	public String getAddrGu() {
		return addrGu;
	}

	public void setAddrGu(String addrGu) {
		this.addrGu = addrGu;
	}

	public int getContentId() {
		return contentId;
	}

	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	public String getContentNum() {
		return contentNum;
	}

	public void setContentNum(String contentNum) {
		this.contentNum = contentNum;
	}

	public String getNewAddr() {
		return newAddr;
	}

	public void setNewAddr(String newAddr) {
		this.newAddr = newAddr;
	}

	public int getCradleCount() {
		return cradleCount;
	}

	public void setCradleCount(int cradleCount) {
		this.cradleCount = cradleCount;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	
	
	
}
