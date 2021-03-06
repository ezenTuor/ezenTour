package com.ezen.tour.history.model;

import java.sql.Timestamp;

public class HistoryVO {
	private int historyNo;
	private int userNo;
	private String state;
	private int packDno;
	private int price;
	private String review;
	private Timestamp regdate;
	private int paymentNo;
	
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
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
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "HistoryVO [historyNo=" + historyNo + ", userNo=" + userNo + ", state=" + state + ", packDno=" + packDno
				+ ", price=" + price + ", review=" + review + ", regdate=" + regdate + ", paymentNo=" + paymentNo + "]";
	}
	
}