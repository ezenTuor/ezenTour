package com.ezen.tour.common;

import org.springframework.stereotype.Component;

@Component
public class SearchVO {
	
	private int user_no = 0;
	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	/** 검색 조건 */
	private String searchCondition = "";
	
	/** 검색 값 */
	private String searchKeyword = "";
    
	/** 검색 사용 */
	private String searchUseYn = "";
	
	/** 현재 페이지 */
	private int currentPage = 1;
	
    
    /** 한 블록의 사이즈 */
    private int blockSize; 
    
    /**  */
    private int firstRecordIndex = 1;
    
    /** �� �ε��� */
    private int lastRecordIndex = 1;
    
    /**페이지 별 레코드 갯수 (pageSize) */
    private int recordCountPerPage;
    
   /**
     * �˻� ������  �����Ѵ�.
     * @param bean �˻�����
     */
    public void setSearchVO(SearchVO bean){
    	this.currentPage = bean.currentPage;
    	this.searchCondition = bean.getSearchCondition();
    	this.searchKeyword = bean.getSearchKeyword();
    	this.searchUseYn = bean.getSearchUseYn();
    	this.blockSize = bean.blockSize;
    	this.firstRecordIndex = bean.firstRecordIndex;
    	this.lastRecordIndex = bean.lastRecordIndex;
    	this.recordCountPerPage = bean.recordCountPerPage;
    }

    public String getSearchCondition() {
    	return searchCondition;
    }

    public void setSearchCondition(String searchCondition) {
    	this.searchCondition = searchCondition;
    }

    public String getSearchKeyword() {
    	return searchKeyword;
    }

    public void setSearchKeyword(String searchKeyword) {
    	this.searchKeyword = searchKeyword;
    }

    public String getSearchUseYn() {
    	return searchUseYn;
    }

    public void setSearchUseYn(String searchUseYn) {
    	this.searchUseYn = searchUseYn;
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

	@Override
	public String toString() {
		return "SearchVO [searchCondition=" + searchCondition
				+ ", searchKeyword=" + searchKeyword + ", searchUseYn="
				+ searchUseYn + ", currentPage=" + currentPage
				+ ", blockSize=" + blockSize + ", firstRecordIndex="
				+ firstRecordIndex + ", lastRecordIndex=" + lastRecordIndex
				+ ", recordCountPerPage=" + recordCountPerPage + "]";
	}

	

	
}
 