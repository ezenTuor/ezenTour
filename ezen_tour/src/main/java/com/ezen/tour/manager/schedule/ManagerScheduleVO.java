package com.ezen.tour.manager.schedule;

public class ManagerScheduleVO {
	private int scheduleNo;
	private int packDno;
	private String detail;
	private String day;
	private String meal;
	private String hotel;
	
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public int getPackDno() {
		return packDno;
	}
	public void setPackDno(int packDno) {
		this.packDno = packDno;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getMeal() {
		return meal;
	}
	public void setMeal(String meal) {
		this.meal = meal;
	}
	public String getHotel() {
		return hotel;
	}
	public void setHotel(String hotel) {
		this.hotel = hotel;
	}
	@Override
	public String toString() {
		return "ManagerScheduleVO [scheduleNo=" + scheduleNo + ", packDno=" + packDno + ", detail=" + detail + ", day="
				+ day + ", meal=" + meal + ", hotel=" + hotel + "]";
	}
	
}
