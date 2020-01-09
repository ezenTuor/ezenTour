package com.ezen.tour.pack.model;

import java.sql.Timestamp;

public class PackDetailVO {

	private int pack_dno;
	private int pack_no;
	private String dep_code;
	private Timestamp korea_dep;
	private Timestamp local_ent;
	private String ent_code;
	private Timestamp local_dep;
	private Timestamp korea_ent;
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
	private int capecity;
	
	public int getPack_dno() {
		return pack_dno;
	}
	public void setpack_dno(int pack_dno) {
		this.pack_dno = pack_dno;
	}
	public int getpack_no() {
		return pack_no;
	}
	public void setpack_no(int pack_no) {
		this.pack_no = pack_no;
	}
	public String getDep_code() {
		return dep_code;
	}
	public void setDep_code(String dep_code) {
		this.dep_code = dep_code;
	}
	public Timestamp getKorea_dep() {
		return korea_dep;
	}
	public void setKorea_dep(Timestamp korea_dep) {
		this.korea_dep = korea_dep;
	}
	public Timestamp getLocal_ent() {
		return local_ent;
	}
	public void setLocal_ent(Timestamp local_ent) {
		this.local_ent = local_ent;
	}
	public String getEnt_code() {
		return ent_code;
	}
	public void setEnt_code(String ent_code) {
		this.ent_code = ent_code;
	}
	public Timestamp getLocal_dep() {
		return local_dep;
	}
	public void setLocal_dep(Timestamp local_dep) {
		this.local_dep = local_dep;
	}
	public Timestamp getKorea_ent() {
		return korea_ent;
	}
	public void setKorea_ent(Timestamp korea_ent) {
		this.korea_ent = korea_ent;
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
	public int getCapecity() {
		return capecity;
	}
	public void setCapecity(int capecity) {
		this.capecity = capecity;
	}
	
	
	
	
	/*
	pack_DNO NUMBER NOT NULL,  패키지 소분류 번호
	pack_NO NUMBER NOT NULL,  패키지번호 
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
