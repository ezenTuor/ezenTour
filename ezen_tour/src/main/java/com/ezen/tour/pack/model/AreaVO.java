package com.ezen.tour.pack.model;

public class AreaVO {
	private int areaNo;
	private String name;
	private String detail;
	
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	@Override
	public String toString() {
		return "AreaVO [areaNo=" + areaNo + ", name=" + name + ", detail=" + detail + "]";
	}
	
	
}
