package com.ezen.tour.common;

import org.springframework.stereotype.Component;

@Component
public class HistorySearchVO {
	private int userNo;
	private String startDate="";
	private String endDate="";
	
	
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	
	@Override
	public String toString() {
		return "HistorySearchVO [userNo=" + userNo + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}
}