package com.ezen.tour.wishList.model;

import java.sql.Timestamp;

public class WishListVO {
	private int WISH_NO;
	private int USER_NO;
	private int PACK_DNO;
	private int MAN;
	private int CHILD;
	private int BABY;
	private int PRICE;
	private String DETAIL;
	private Timestamp WISH_DATE;
	public int getWISH_NO() {
		return WISH_NO;
	}
	public void setWISH_NO(int wISH_NO) {
		WISH_NO = wISH_NO;
	}
	public int getUSER_NO() {
		return USER_NO;
	}
	public void setUSER_NO(int uSER_NO) {
		USER_NO = uSER_NO;
	}
	public int getPACK_DNO() {
		return PACK_DNO;
	}
	public void setPACK_DNO(int pACK_DNO) {
		PACK_DNO = pACK_DNO;
	}
	public int getMAN() {
		return MAN;
	}
	public void setMAN(int mAN) {
		MAN = mAN;
	}
	public int getCHILD() {
		return CHILD;
	}
	public void setCHILD(int cHILD) {
		CHILD = cHILD;
	}
	public int getBABY() {
		return BABY;
	}
	public void setBABY(int bABY) {
		BABY = bABY;
	}
	public int getPRICE() {
		return PRICE;
	}
	public void setPRICE(int pRICE) {
		PRICE = pRICE;
	}
	public String getDETAIL() {
		return DETAIL;
	}
	public void setDETAIL(String dETAIL) {
		DETAIL = dETAIL;
	}
	public Timestamp getWISH_DATE() {
		return WISH_DATE;
	}
	public void setWISH_DATE(Timestamp wISH_DATE) {
		WISH_DATE = wISH_DATE;
	}
	@Override
	public String toString() {
		return "WishListVO [WISH_NO=" + WISH_NO + ", USER_NO=" + USER_NO + ", PACK_DNO=" + PACK_DNO + ", MAN=" + MAN
				+ ", CHILD=" + CHILD + ", BABY=" + BABY + ", PRICE=" + PRICE + ", DETAIL=" + DETAIL + ", WISH_DATE="
				+ WISH_DATE + "]";
	}
}