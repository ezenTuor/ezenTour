package com.ezen.tour.country.model;

public class CountryVO {
	private String countryCode;
	private String code3;
	private String code2;
	private String name;
	private String nameEng;
	
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	public String getCode3() {
		return code3;
	}
	public void setCode3(String code3) {
		this.code3 = code3;
	}
	public String getCode2() {
		return code2;
	}
	public void setCode2(String code2) {
		this.code2 = code2;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNameEng() {
		return nameEng;
	}
	public void setNameEng(String nameEng) {
		this.nameEng = nameEng;
	}
	
	@Override
	public String toString() {
		return "CountryVO [countryCode=" + countryCode + ", code3=" + code3 + ", code2=" + code2 + ", name=" + name
				+ ", nameEng=" + nameEng + "]";
	}
}
