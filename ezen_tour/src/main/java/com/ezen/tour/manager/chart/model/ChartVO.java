package com.ezen.tour.manager.chart.model;

public class ChartVO {
	private int price;
	private String gender;
	private int areaNo;
	private String year;
	private String month;
	private int agerange;
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAreaNo() {
		return areaNo;
	}
	public void setAreaNo(int areaNo) {
		this.areaNo = areaNo;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getAgerange() {
		return agerange;
	}
	public void setAgerange(int agerange) {
		this.agerange = agerange;
	}
	@Override
	public String toString() {
		return "ChartVO [price=" + price + ", gender=" + gender + ", areaNo=" + areaNo + ", year=" + year + ", month="
				+ month + ", agerange=" + agerange + "]";
	}
	
}
