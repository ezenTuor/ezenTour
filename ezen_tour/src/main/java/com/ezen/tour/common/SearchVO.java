package com.ezen.tour.common;


/**
 * �˻� ������ ����ִ� Bean
 * ����¡ ó�� ���� ���� ����
*/

public class SearchVO {
	
	private int user_no = 0;
	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	/** �˻����� */
	private String searchCondition = "";
	
	/** �˻�Ű���� */
	private String searchKeyword = "";
    
	/** �˻� ��뿩�� */
	private String searchUseYn = "";
	
	/** ���� ������ */
	private int currentPage = 1;
	
    
    /**���� ������ ������ ��,  ������ ������ */
    private int blockSize; // properties���� ����
    
    /** ���� �ε��� */
    private int firstRecordIndex = 1;
    
    /** �� �ε��� */
    private int lastRecordIndex = 1;
    
    /**������ �� ���ڵ� ���� (pageSize) */
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
 