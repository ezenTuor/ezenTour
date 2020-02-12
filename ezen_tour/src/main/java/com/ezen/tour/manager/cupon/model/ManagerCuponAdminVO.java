package com.ezen.tour.manager.cupon.model;

public class ManagerCuponAdminVO {
	private int cuponSerial;
	private String cuponDetail;
	private String cuponKind;
	private int discount;
	private String regdate;
	private String delType;
	private String deldate;
	private String delFlag;
	
	public int getCuponSerial() {
		return cuponSerial;
	}
	public void setCuponSerial(int cuponSerial) {
		this.cuponSerial = cuponSerial;
	}
	public String getCuponDetail() {
		return cuponDetail;
	}
	public void setCuponDetail(String cuponDetail) {
		this.cuponDetail = cuponDetail;
	}
	public String getCuponKind() {
		return cuponKind;
	}
	public void setCuponKind(String cuponKind) {
		this.cuponKind = cuponKind;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getDelType() {
		return delType;
	}
	public void setDelType(String delType) {
		this.delType = delType;
	}
	public String getDeldate() {
		return deldate;
	}
	public void setDeldate(String deldate) {
		this.deldate = deldate;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	
	@Override
	public String toString() {
		return "ManagerCuponAdminVO [cuponSerial=" + cuponSerial + ", cuponDetail=" + cuponDetail + ", cuponKind="
				+ cuponKind + ", discount=" + discount + ", regdate=" + regdate + ", delType=" + delType + ", deldate="
				+ deldate + ", delFlag=" + delFlag + "]";
	}
	
}
