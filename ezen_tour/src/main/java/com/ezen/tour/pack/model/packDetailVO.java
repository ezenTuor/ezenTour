package com.ezen.tour.pack.model;

import java.sql.Timestamp;

public class packDetailVO {
	/*테스트*/
	private int package_dno;
	private int package_no;
	private Timestamp depart;
	private Timestamp enter;
	private int man;
	private int child;
	private int baby;
	private String airline;
	private String days_detail;
	private char shopping;
	private char hotel_grade;
	private String details;
	private String destinations;
	private String dates;
	private String travel_flag;
	
	public int getPackage_dno() {
		return package_dno;
	}
	public void setPackage_dno(int package_dno) {
		this.package_dno = package_dno;
	}
	public int getPackage_no() {
		return package_no;
	}
	public void setPackage_no(int package_no) {
		this.package_no = package_no;
	}
	public Timestamp getDepart() {
		return depart;
	}
	public void setDepart(Timestamp depart) {
		this.depart = depart;
	}
	public Timestamp getEnter() {
		return enter;
	}
	public void setEnter(Timestamp enter) {
		this.enter = enter;
	}
	public int getMan() {
		return man;
	}
	public void setMan(int man) {
		this.man = man;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public int getBaby() {
		return baby;
	}
	public void setBaby(int baby) {
		this.baby = baby;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getDays_detail() {
		return days_detail;
	}
	public void setDays_detail(String days_detail) {
		this.days_detail = days_detail;
	}
	public char getShopping() {
		return shopping;
	}
	public void setShopping(char shopping) {
		this.shopping = shopping;
	}
	public char getHotel_grade() {
		return hotel_grade;
	}
	public void setHotel_grade(char hotel_grade) {
		this.hotel_grade = hotel_grade;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getDestinations() {
		return destinations;
	}
	public void setDestinations(String destinations) {
		this.destinations = destinations;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getTravel_flag() {
		return travel_flag;
	}
	public void setTravel_flag(String travel_flag) {
		this.travel_flag = travel_flag;
	}
	
	/*
	PACKAGE_DNO NUMBER NOT NULL,  패키지 소분류 번호
	PACKAGE_NO NUMBER NOT NULL,  패키지번호 
	DEPART DATE NOT NULL, 한국출발날짜 
	ENTER DATE NOT NULL, 한국도착날짜 
	MAN NUMBER,  성인가격 
	CHILD NUMBER, 유아가격 
	BABY NUMBER, 아동가격 
	AIRLINE VARCHAR2(300), 항공사명 
	DAYS_DETAIL VARCHAR2(30) NOT NULL, 여행기간 
	SHOPPING CHAR, 쇼핑여부
	HOTEL_GRADE CHAR, 숙소등급 
	DETAILS CLOB, 내용 
	DESTINATIONS VARCHAR2(1000), 경유지 
	DATES VARCHAR2(1000), 시간 
	TRAVEL_FLAG VARCHAR2(30)  여행구분 
	*/
	
	
	
}
