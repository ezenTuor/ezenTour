package com.ezen.tour.coupon.model;

import java.sql.Timestamp;

public class CouponVO {
	private int CUPON_NO;
	private int CUPON_SERIAL;
	private int USER_NO;
	private String USE_FLAG;
	private Timestamp REGDATE;
	private Timestamp DELDATE;
	private Timestamp USEDATE;
	private String DEL_FLAG;
	public int getCUPON_NO() {
		return CUPON_NO;
	}
	public void setCUPON_NO(int cUPON_NO) {
		CUPON_NO = cUPON_NO;
	}
	public int getCUPON_SERIAL() {
		return CUPON_SERIAL;
	}
	public void setCUPON_SERIAL(int cUPON_SERIAL) {
		CUPON_SERIAL = cUPON_SERIAL;
	}
	public int getUSER_NO() {
		return USER_NO;
	}
	public void setUSER_NO(int uSER_NO) {
		USER_NO = uSER_NO;
	}
	public String getUSE_FLAG() {
		return USE_FLAG;
	}
	public void setUSE_FLAG(String uSE_FLAG) {
		USE_FLAG = uSE_FLAG;
	}
	public Timestamp getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(Timestamp rEGDATE) {
		REGDATE = rEGDATE;
	}
	public Timestamp getDELDATE() {
		return DELDATE;
	}
	public void setDELDATE(Timestamp dELDATE) {
		DELDATE = dELDATE;
	}
	public Timestamp getUSEDATE() {
		return USEDATE;
	}
	public void setUSEDATE(Timestamp uSEDATE) {
		USEDATE = uSEDATE;
	}
	public String getDEL_FLAG() {
		return DEL_FLAG;
	}
	public void setDEL_FLAG(String dEL_FLAG) {
		DEL_FLAG = dEL_FLAG;
	}
	@Override
	public String toString() {
		return "CouponVO [CUPON_NO=" + CUPON_NO + ", CUPON_SERIAL=" + CUPON_SERIAL + ", USER_NO=" + USER_NO
				+ ", USE_FLAG=" + USE_FLAG + ", REGDATE=" + REGDATE + ", DELDATE=" + DELDATE + ", USEDATE=" + USEDATE
				+ ", DEL_FLAG=" + DEL_FLAG + "]";
	}
}
