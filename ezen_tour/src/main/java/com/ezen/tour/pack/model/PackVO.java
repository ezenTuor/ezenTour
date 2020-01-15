package com.ezen.tour.pack.model;

import java.sql.Timestamp;

public class PackVO {
	
	private int packNo;
	private String name;
	private String imgNames;
	private String imgSizes;
	private String conutry;
	private String city;
	private String keyword;
	private String airport;
	private String days;
	private String daysWeek;
	private String detail;
	private Timestamp regdate;
	
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
	public String getConutry() {
		return conutry;
	}
	public void setConutry(String conutry) {
		this.conutry = conutry;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "PackVO [packNo=" + packNo + ", name=" + name + ", imgNames=" + imgNames + ", imgSizes=" + imgSizes
				+ ", conutry=" + conutry + ", city=" + city + ", keyword=" + keyword + ", airport=" + airport
				+ ", days=" + days + ", daysWeek=" + daysWeek + ", detail=" + detail + ", regdate=" + regdate + "]";
	} 
	
}
