package com.ezen.tour.member.model;

import java.sql.Timestamp;

import com.ezen.tour.common.SearchVO;

public class MemberVO extends SearchVO{
	private int userNo;
	private String userId;
	private String userPwd;
	private String name;
	private int zipcode;
	private String address;
	private String addressDetail;
	private String hp1;
	private String hp2;
	private String hp3;
	private String email1;
	private String email2;
	private String grade;
	private String userSsr;
	private String gender;
	private Timestamp regdate;
	private String delFlag;
	private Timestamp deldate;
	private int mileage;
	
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getZipcode() {
		return zipcode;
	}
	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getAddressDetail() {
		return addressDetail;
	}
	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getUserSsr() {
		return userSsr;
	}
	public void setUserSsr(String userSsr) {
		this.userSsr = userSsr;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	public Timestamp getDeldate() {
		return deldate;
	}
	public void setDeldate(Timestamp deldate) {
		this.deldate = deldate;
	}
	@Override
	public String toString() {
		return "MemberVO [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", name=" + name
				+ ", zipcode=" + zipcode + ", address=" + address + ", addressDetail=" + addressDetail + ", hp1=" + hp1
				+ ", hp2=" + hp2 + ", hp3=" + hp3 + ", email1=" + email1 + ", email2=" + email2 + ", grade=" + grade
				+ ", userSsr=" + userSsr + ", gender=" + gender + ", regdate=" + regdate + ", delFlag=" + delFlag
				+ ", deldate=" + deldate + ", mileage=" + mileage + ", toString()=" + super.toString() + "]";
	}
}
