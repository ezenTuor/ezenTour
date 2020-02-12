package com.ezen.tour.manager.chart.model;


public class SearchChartVO {
	
	private String gender = "";
	
	private String areaNo = "";
	
	private String year = "";
	
	private String month ="";
	
	private int agerange=0;
	
	/** 현재 페이지 */
	private int currentPage = 1;
    
    /** 한 블록의 사이즈 */
    private int blockSize; 
    
    /** 페이지 시작 레코드 인덱스 */
    private int firstRecordIndex = 1;
    
    /** 페이지 끝 레코드 인덱스 */
    private int lastRecordIndex = 1;
    
    /**페이지 별 레코드 갯수 (pageSize) */
    private int recordCountPerPage;
    

    public void setSearchChartVO(SearchChartVO bean){
    	this.currentPage = bean.currentPage;
    	this.gender = bean.getGender();
    	this.areaNo = bean.getAreaNo();
    	this.year = bean.getYear();
    	this.month = bean.getMonth();
    	this.agerange=bean.getAgerange();
    	this.blockSize = bean.blockSize;
    	this.firstRecordIndex = bean.firstRecordIndex;
    	this.lastRecordIndex = bean.lastRecordIndex;
    	this.recordCountPerPage = bean.recordCountPerPage;
    }
    
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAreaNo() {
		return areaNo;
	}


	public void setAreaNo(String areaNo) {
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


	public int getCurrentPage() {
		return currentPage;
	}


	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}


	public int getBlockSize() {
		return blockSize;
	}


	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}


	public int getFirstRecordIndex() {
		return firstRecordIndex;
	}


	public void setFirstRecordIndex(int firstRecordIndex) {
		this.firstRecordIndex = firstRecordIndex;
	}


	public int getLastRecordIndex() {
		return lastRecordIndex;
	}


	public void setLastRecordIndex(int lastRecordIndex) {
		this.lastRecordIndex = lastRecordIndex;
	}


	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}


	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}


	public int getAgerange() {
		return agerange;
	}

	public void setAgerange(int agerange) {
		this.agerange = agerange;
	}

	@Override
	public String toString() {
		return "SearchChartVO [gender=" + gender + ", areaNo=" + areaNo + ", year=" + year + ", month=" + month
				+ ", agerange=" + agerange + ", currentPage=" + currentPage + ", blockSize=" + blockSize
				+ ", firstRecordIndex=" + firstRecordIndex + ", lastRecordIndex=" + lastRecordIndex
				+ ", recordCountPerPage=" + recordCountPerPage + "]";
	}

   
}
