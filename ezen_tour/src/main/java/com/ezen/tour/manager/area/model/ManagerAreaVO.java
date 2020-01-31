package com.ezen.tour.manager.area.model;

public class ManagerAreaVO {
	private int areaNo;
	private String areaC;
	private String name;
	private String detail;
	
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public String getAreaC() {
		return areaC;
	}
	public void setAreaC(String areaC) {
		this.areaC = areaC;
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
		return "AreaVO [areaNo=" + areaNo + ", areaC=" + areaC + ", name=" + name + ", detail=" + detail + "]";
	}
	
}
