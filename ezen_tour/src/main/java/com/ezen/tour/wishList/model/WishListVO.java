package com.ezen.tour.wishList.model;

import java.sql.Timestamp;

public class WishListVO {
	private int wishNo;
	private int userNo;
	private int packDno;
	private int man;
	private int child;
	private int baby;
	private int price;
	private String detail;
	private Timestamp wishDate;
	
	public int getWishNo() {
		return wishNo;
	}
	public void setWishNo(int wishNo) {
		this.wishNo = wishNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getPackDno() {
		return packDno;
	}
	public void setPackDno(int packDno) {
		this.packDno = packDno;
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Timestamp getWishDate() {
		return wishDate;
	}
	public void setWishDate(Timestamp wishDate) {
		this.wishDate = wishDate;
	}
	@Override
	public String toString() {
		return "WishListVO [wishNo=" + wishNo + ", userNo=" + userNo + ", packNo=" + packDno + ", man=" + man
				+ ", child=" + child + ", baby=" + baby + ", price=" + price + ", detail=" + detail + ", wishDate="
				+ wishDate + "]";
	}
	
}