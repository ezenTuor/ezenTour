package com.ezen.tour.pack.model;

public class PackAjaxVO {
	private String koreaDep;
	private int packNo;
	public String getKoreaDep() {
		return koreaDep;
	}
	public void setKoreaDep(String koreaDep) {
		this.koreaDep = koreaDep;
	}
	public int getPackNo() {
		return packNo;
	}
	public void setPackNo(int packNo) {
		this.packNo = packNo;
	}
	@Override
	public String toString() {
		return "PackAjaxVO [koreaDep=" + koreaDep + ", packNo=" + packNo + "]";
	}
	
	

}
