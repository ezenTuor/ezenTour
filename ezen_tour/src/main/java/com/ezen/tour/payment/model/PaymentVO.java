package com.ezen.tour.payment.model;

import java.sql.Timestamp;

public class PaymentVO {
	private int paymentNo;
	private int userNo;
	private int discount;
	private int price;
	private String type;
	private Timestamp regdate; 
	private String detail;
	private String merchUid;
	private String impUid;
	
	public String getMerchUid() {
		return merchUid;
	}
	public void setMerchUid(String merchUid) {
		this.merchUid = merchUid;
	}
	public int getPaymentNo() {
		return paymentNo;
	}
	public void setPaymentNo(int paymentNo) {
		this.paymentNo = paymentNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getImpUid() {
		return impUid;
	}
	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}
	
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	@Override
	public String toString() {
		return "PaymentVO [paymentNo=" + paymentNo + ", userNo=" + userNo + ", discount=" + discount + ", price="
				+ price + ", type=" + type + ", regdate=" + regdate + ", detail=" + detail
				+ ", impUid=" + impUid + ", merchUid=" + merchUid + "]";
	}
	
}
