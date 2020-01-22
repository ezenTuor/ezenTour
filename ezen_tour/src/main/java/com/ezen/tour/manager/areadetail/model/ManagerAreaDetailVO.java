package com.ezen.tour.manager.areadetail.model;

public class ManagerAreaDetailVO {
	private int tagNo;
	private int areaNo;
	private String name;
	private String keyword;
	
	public int getTagNo() {
		return tagNo;
	}
	public void setTagNo(int tagNo) {
		this.tagNo = tagNo;
	}
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
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "AreaDetailVO [tagNo=" + tagNo + ", areaNo=" + areaNo + ", name=" + name + ", keyword=" + keyword + "]";
	}
	
}
