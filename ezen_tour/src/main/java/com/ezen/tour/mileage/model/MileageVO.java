package com.ezen.tour.mileage.model;

import java.sql.Timestamp;

public class MileageVO {
	private int mileageNo;
	private int userNo;
	private Timestamp regdate;
	private int point;
	private String detail;
	
	public int getMileageNo() {
		return mileageNo;
	}
	public void setMileageNo(int mileageNo) {
		this.mileageNo = mileageNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "MileageVO [mileageNo=" + mileageNo + ", userNo=" + userNo + ", regdate=" + regdate + ", point=" + point
				+ ", detail=" + detail + "]";
	}
	
}
