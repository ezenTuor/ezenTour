package com.ezen.tour.mileage.model;

import java.sql.Timestamp;

public class MileageVO {
	private int MILEAGE_NO;
	private int USER_NO;
	private Timestamp REGDATE;
	private int POINT;
	private String DETAIL;
	public int getMILEAGE_NO() {
		return MILEAGE_NO;
	}
	public void setMILEAGE_NO(int mILEAGE_NO) {
		MILEAGE_NO = mILEAGE_NO;
	}
	public int getUSER_NO() {
		return USER_NO;
	}
	public void setUSER_NO(int uSER_NO) {
		USER_NO = uSER_NO;
	}
	public Timestamp getREGDATE() {
		return REGDATE;
	}
	public void setREGDATE(Timestamp rEGDATE) {
		REGDATE = rEGDATE;
	}
	public int getPOINT() {
		return POINT;
	}
	public void setPOINT(int pOINT) {
		POINT = pOINT;
	}
	public String getDETAIL() {
		return DETAIL;
	}
	public void setDETAIL(String dETAIL) {
		DETAIL = dETAIL;
	}
	@Override
	public String toString() {
		return "MileageVO [MILEAGE_NO=" + MILEAGE_NO + ", USER_NO=" + USER_NO + ", REGDATE=" + REGDATE + ", POINT="
				+ POINT + ", DETAIL=" + DETAIL + "]";
	}
}
