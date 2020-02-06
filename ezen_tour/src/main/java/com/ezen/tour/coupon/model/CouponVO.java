package com.ezen.tour.coupon.model;

import java.sql.Timestamp;

import com.ezen.tour.common.SearchVO;

public class CouponVO{
	private int cuponNo;
	private int cuponSerial;
	private int userNo;
	private String useFlag;
	private Timestamp regdate;
	private Timestamp deldate;
	private Timestamp usedate;
	private String delFlag;
	
	public int getCuponNo() {
		return cuponNo;
	}
	public void setCuponNo(int cuponNo) {
		this.cuponNo = cuponNo;
	}
	public int getCuponSerial() {
		return cuponSerial;
	}
	public void setCuponSerial(int cuponSerial) {
		this.cuponSerial = cuponSerial;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUseFlag() {
		return useFlag;
	}
	public void setUseFlag(String useFlag) {
		this.useFlag = useFlag;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public Timestamp getDeldate() {
		return deldate;
	}
	public void setDeldate(Timestamp deldate) {
		this.deldate = deldate;
	}
	public Timestamp getUsedate() {
		return usedate;
	}
	public void setUsedate(Timestamp usedate) {
		this.usedate = usedate;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	@Override
	public String toString() {
		return "CouponVO [cuponNo=" + cuponNo + ", cuponSerial=" + cuponSerial + ", userNo=" + userNo + ", useFlag="
				+ useFlag + ", regdate=" + regdate + ", deldate=" + deldate + ", usedate=" + usedate + ", delFlag="
				+ delFlag + "]";
	}
	
}
