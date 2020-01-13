package com.ezen.tour.manager.pack.model;

public class ManagerPackVo {
	private int packNo;
	private String name;
	private String imgNames;
	private String imgSizes;
	private String destnation;
	private String airport;
	private String days;
	private String daysWeek;
	public int getPackNo() {
		return packNo;
	}
	public void setPackNo(int packNo) {
		this.packNo = packNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImgNames() {
		return imgNames;
	}
	public void setImgNames(String imgNames) {
		this.imgNames = imgNames;
	}
	public String getImgSizes() {
		return imgSizes;
	}
	public void setImgSizes(String imgSizes) {
		this.imgSizes = imgSizes;
	}
	public String getDestnation() {
		return destnation;
	}
	public void setDestnation(String destnation) {
		this.destnation = destnation;
	}
	public String getAirport() {
		return airport;
	}
	public void setAirport(String airport) {
		this.airport = airport;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getDaysWeek() {
		return daysWeek;
	}
	public void setDaysWeek(String daysWeek) {
		this.daysWeek = daysWeek;
	}
	@Override
	public String toString() {
		return "ManagerPackVo [packNo=" + packNo + ", name=" + name + ", imgNames=" + imgNames + ", imgSizes="
				+ imgSizes + ", destnation=" + destnation + ", airport=" + airport + ", days=" + days + ", daysWeek="
				+ daysWeek + "]";
	}
	
}
