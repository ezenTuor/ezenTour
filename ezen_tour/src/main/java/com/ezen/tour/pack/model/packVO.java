package com.ezen.tour.pack.model;

public class packVO {
	
	private int pack_no;
	private String name;
	private String img_names;
	private String img_sizes;
	private String destnation;
	private String airport;
	private String days;
	private String days_week;
	
	/*
	pack_NO NUMBER NOT NULL,  패키지번호 
	NAME VARCHAR2(100),  패키지이름 
	IMG_NAMES VARCHAR2(1000),  이미지이름(LIST) 
	IMG_SIZES VARCHAR2(1000),  D이미지크기(LIST) 
	DESTNATION VARCHAR2(100),  여행국가 
	AIRPORT VARCHAR2(100), 이용항공 
	DAYS VARCHAR2(60),  여행기간 
	DAYS_WEEK VARCHAR2(60)  출발요일 
	*/
	
	public int getpack_no() {
		return pack_no;
	}
	public void setpack_no(int pack_no) {
		this.pack_no = pack_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg_names() {
		return img_names;
	}
	public void setImg_names(String img_names) {
		this.img_names = img_names;
	}
	public String getImg_sizes() {
		return img_sizes;
	}
	public void setImg_sizes(String img_sizes) {
		this.img_sizes = img_sizes;
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
	public String getDays_week() {
		return days_week;
	}
	public void setDays_week(String days_week) {
		this.days_week = days_week;
	}
	

}
