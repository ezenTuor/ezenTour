package com.ezen.tour.pack.model;

import java.sql.Timestamp;

public class PackDetailVO {

	private int packDno;
	private int packNo;
	private String depCode;
	private Timestamp koreaDep;
	private Timestamp localEnt;
	private String entCode;
	private Timestamp localDep;
	private Timestamp koreaEnt;
	private int man;
	private int child;
	private int baby;
	private String airline;
	private String days_detail;
	private char shopping;
	private String details;
	private String destinations;
	private String dates;
	private String travel_flag;
	private int capecity_min;
	private int capecity;
	
	public int getPackDno() {
		return packDno;
	}
	public void setPackDno(int packDno) {
		this.packDno = packDno;
	}
	public int getPackNo() {
		return packNo;
	}
	public void setPackNo(int packNo) {
		this.packNo = packNo;
	}
	public String getDepCode() {
		return depCode;
	}
	public void setDepCode(String depCode) {
		this.depCode = depCode;
	}
	public Timestamp getKoreaDep() {
		return koreaDep;
	}
	public void setKoreaDep(Timestamp koreaDep) {
		this.koreaDep = koreaDep;
	}
	public Timestamp getLocalEnt() {
		return localEnt;
	}
	public void setLocalEnt(Timestamp localEnt) {
		this.localEnt = localEnt;
	}
	public String getEntCode() {
		return entCode;
	}
	public void setEntCode(String entCode) {
		this.entCode = entCode;
	}
	public Timestamp getLocalDep() {
		return localDep;
	}
	public void setLocalDep(Timestamp localDep) {
		this.localDep = localDep;
	}
	public Timestamp getKoreaEnt() {
		return koreaEnt;
	}
	public void setKoreaEnt(Timestamp koreaEnt) {
		this.koreaEnt = koreaEnt;
	}
	public int getMan() {
		return man;
	}
	public void setMan(int man) {
		this.man = man;
	}
	public int getChild() {
		return child;
	}
	public void setChild(int child) {
		this.child = child;
	}
	public int getBaby() {
		return baby;
	}
	public void setBaby(int baby) {
		this.baby = baby;
	}
	public String getAirline() {
		return airline;
	}
	public void setAirline(String airline) {
		this.airline = airline;
	}
	public String getDays_detail() {
		return days_detail;
	}
	public void setDays_detail(String days_detail) {
		this.days_detail = days_detail;
	}
	public char getShopping() {
		return shopping;
	}
	public void setShopping(char shopping) {
		this.shopping = shopping;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public String getDestinations() {
		return destinations;
	}
	public void setDestinations(String destinations) {
		this.destinations = destinations;
	}
	public String getDates() {
		return dates;
	}
	public void setDates(String dates) {
		this.dates = dates;
	}
	public String getTravel_flag() {
		return travel_flag;
	}
	public void setTravel_flag(String travel_flag) {
		this.travel_flag = travel_flag;
	}
	public int getCapecity_min() {
		return capecity_min;
	}
	public void setCapecity_min(int capecity_min) {
		this.capecity_min = capecity_min;
	}
	public int getCapecity() {
		return capecity;
	}
	public void setCapecity(int capecity) {
		this.capecity = capecity;
	}
	
	@Override
	public String toString() {
		return "PackDetailVO [packDno=" + packDno + ", packNo=" + packNo + ", depCode=" + depCode + ", koreaDep="
				+ koreaDep + ", localEnt=" + localEnt + ", entCode=" + entCode + ", localDep=" + localDep
				+ ", koreaEnt=" + koreaEnt + ", man=" + man + ", child=" + child + ", baby=" + baby + ", airline="
				+ airline + ", days_detail=" + days_detail + ", shopping=" + shopping + ", details=" + details
				+ ", destinations=" + destinations + ", dates=" + dates + ", travel_flag=" + travel_flag
				+ ", capecity_min=" + capecity_min + ", capecity=" + capecity + "]";
	}
	
	
}
