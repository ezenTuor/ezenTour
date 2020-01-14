package com.ezen.tour.member.model;

import java.sql.Timestamp;

public class MemberVO {
	private int user_no;
	private String user_id;
	private String user_pwd;
	private String name;
	private int zipcode;
	private String address;
	private String address_detail;
	private String hp1;
	private String hp2;
	private String hp3;
	private String email1;
	private String email2;
	private String grade;
	private String user_ssr;
	private String gender;
	private Timestamp regdate;
	private String del_flag;
	private Timestamp deldate;
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
	
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
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
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getUser_ssr() {
		return user_ssr;
	}
	public void setUser_ssr(String user_ssr) {
		this.user_ssr = user_ssr;
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
	public String getDel_flag() {
		return del_flag;
	}
	public void setDel_flag(String del_flag) {
		this.del_flag = del_flag;
	}
	public Timestamp getDeldate() {
		return deldate;
	}
	public void setDeldate(Timestamp deldate) {
		this.deldate = deldate;
	}
	@Override
	public String toString() {
		return "MemberVO [user_no=" + user_no + ", user_id=" + user_id + ", user_pwd=" + user_pwd + ", name=" + name
				+ ", zipcode=" + zipcode + ", address=" + address + ", address_detail=" + address_detail + ", hp1="
				+ hp1 + ", hp2=" + hp2 + ", hp3=" + hp3 + ", email1=" + email1 + ", email2=" + email2 + ", grade="
				+ grade + ", user_ssr=" + user_ssr + ", gender=" + gender + ", regdate=" + regdate + ", del_flag="
				+ del_flag + ", deldate=" + deldate + "]";
	}
}
