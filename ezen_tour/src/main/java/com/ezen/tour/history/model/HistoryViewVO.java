package com.ezen.tour.history.model;

import java.sql.Timestamp;

//history_view VO입니당~
public class HistoryViewVO {
	private int historyNo;
	private int userNo;
	private String state;
	private int packDno;
	private int price;
	private Timestamp regdate;
	private String review;
	private Timestamp koreaDep;
	private Timestamp koreaEnt;
	private String name;
	private String check;
	
	
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getPackDno() {
		return packDno;
	}
	public void setPackDno(int packDno) {
		this.packDno = packDno;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Timestamp getKoreaDep() {
		return koreaDep;
	}
	public void setKoreaDep(Timestamp koreaDep) {
		this.koreaDep = koreaDep;
	}
	public Timestamp getKoreaEnt() {
		return koreaEnt;
	}
	public void setKoreaEnt(Timestamp koreaEnt) {
		this.koreaEnt = koreaEnt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCheck() {
		return check;
	}
	public void setCheck(String check) {
		this.check = check;
	}
	
	
	@Override
	public String toString() {
		return "HistoryViewVO [historyNo=" + historyNo + ", userNo=" + userNo + ", state=" + state + ", packDno="
				+ packDno + ", price=" + price + ", regdate=" + regdate + ", review=" + review + ", koreaDep="
				+ koreaDep + ", koreaEnt=" + koreaEnt + ", name=" + name + ", check=" + check + "]";
	}
}