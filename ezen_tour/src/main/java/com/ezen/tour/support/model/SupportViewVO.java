package com.ezen.tour.support.model;

public class SupportViewVO {
	private int supportNo;
	private int userNo;
	private String title;
	private String content;
	private String regdate;
	private int groupNo;
	private int step;
	private int sort;
	private String asFlag;
	private String userId;
	private String name;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSupportNo() {
		return supportNo;
	}
	public void setSupportNo(int supportNo) {
		this.supportNo = supportNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public String getAsFlag() {
		return asFlag;
	}
	public void setAsFlag(String asFlag) {
		this.asFlag = asFlag;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	@Override
	public String toString() {
		return "SupportViewVO [supportNo=" + supportNo + ", userNo=" + userNo + ", title=" + title + ", content="
				+ content + ", regdate=" + regdate + ", groupNo=" + groupNo + ", step=" + step + ", sort=" + sort
				+ ", asFlag=" + asFlag + ", userId=" + userId + ", name=" + name + "]";
	}
	
}
