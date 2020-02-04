package com.ezen.tour.manager.packDetail.model;

public class ManagerDetailVO {
	private int packDno;
	private int packNo;
	private String depCode;
	private String koreaDep;
	private String localEnt;
	private String entCode;
	private String localDep;
	private String koreaEnt;
	private int man;
	private int child;
	private int baby;
	private String airline;
	private String daysDetail;
	private String shopping;
	private String details;
	private int capecityMin;
	private int capecity;
	private int capecityCur;
	
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
	public String getKoreaDep() {
		return koreaDep;
	}
	public void setKoreaDep(String koreaDep) {
		this.koreaDep = koreaDep;
	}
	public String getLocalEnt() {
		return localEnt;
	}
	public void setLocalEnt(String localEnt) {
		this.localEnt = localEnt;
	}
	public String getEntCode() {
		return entCode;
	}
	public void setEntCode(String entCode) {
		this.entCode = entCode;
	}
	public String getLocalDep() {
		return localDep;
	}
	public void setLocalDep(String localDep) {
		this.localDep = localDep;
	}
	public String getKoreaEnt() {
		return koreaEnt;
	}
	public void setKoreaEnt(String koreaEnt) {
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
	public String getDaysDetail() {
		return daysDetail;
	}
	public void setDaysDetail(String daysDetail) {
		this.daysDetail = daysDetail;
	}
	public String getShopping() {
		return shopping;
	}
	public void setShopping(String shopping) {
		this.shopping = shopping;
	}
	public String getDetails() {
		return details;
	}
	public void setDetails(String details) {
		this.details = details;
	}
	public int getCapecityMin() {
		return capecityMin;
	}
	public void setCapecityMin(int capecityMin) {
		this.capecityMin = capecityMin;
	}
	public int getCapecity() {
		return capecity;
	}
	public void setCapecity(int capecity) {
		this.capecity = capecity;
	}
	public int getCapecityCur() {
		return capecityCur;
	}
	public void setCapecityCur(int capecityCur) {
		this.capecityCur = capecityCur;
	}
	@Override
	public String toString() {
		return "ManagerPackDetailVO [packDno=" + packDno + ", packNo=" + packNo + ", depCode=" + depCode + ", koreaDep="
				+ koreaDep + ", localEnt=" + localEnt + ", entCode=" + entCode + ", localDep=" + localDep
				+ ", koreaEnt=" + koreaEnt + ", man=" + man + ", child=" + child + ", baby=" + baby + ", airline="
				+ airline + ", daysDetail=" + daysDetail + ", shopping=" + shopping + ", details=" + details
				+ ", capecityMin=" + capecityMin + ", capecity=" + capecity + ", capecityCur=" + capecityCur + "]";
	}

}
