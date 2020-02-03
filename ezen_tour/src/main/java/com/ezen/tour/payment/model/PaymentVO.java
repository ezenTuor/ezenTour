package com.ezen.tour.payment.model;

import java.sql.Timestamp;

public class PaymentVO {
	private int PAYMENT_NO;
	private int USER_NO;
	private int DISCOUNT;
	private int PRICE;
	private String STATE;
	private String TYPE;
	private Timestamp REGDATE;
	private String DETAIL;
	
	public int getPAYMENT_NO() {
		return PAYMENT_NO;
	}
	public void setPAYMENT_NO(int pAYMENT_NO) {
		PAYMENT_NO = pAYMENT_NO;
	}
	public int getUSER_NO() {
		return USER_NO;
	}
	public void setUSER_NO(int uSER_NO) {
		USER_NO = uSER_NO;
	}
	public int getDISCOUNT() {
		return DISCOUNT;
	}
	public void setDISCOUNT(int dISCOUNT) {
		DISCOUNT = dISCOUNT;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public String getSTATE() {
		return STATE;
	}
	public void setSTATE(String sTATE) {
		STATE = sTATE;
	}
	public String getTYPE() {
		return TYPE;
	}
	public void setTYPE(String tYPE) {
		TYPE = tYPE;
	}
	public Timestamp getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(Timestamp rEGDATE) {
		REGDATE = rEGDATE;
	}
	public String getDETAIL() {
		return DETAIL;
	}
	public void setDETAIL(String dETAIL) {
		DETAIL = dETAIL;
	}
	@Override
	public String toString() {
		return "PaymentVO [PAYMENT_NO=" + PAYMENT_NO + ", USER_NO=" + USER_NO + ", DISCOUNT=" + DISCOUNT + ", PRICE="
				+ PRICE + ", STATE=" + STATE + ", TYPE=" + TYPE + ", REGDATE=" + REGDATE + ", DETAIL=" + DETAIL + "]";
	}
}
