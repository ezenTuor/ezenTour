package com.ezen.tour.common;


/**
 * °Ë»ö Á¤º¸¸¦ ´ã°íÀÖ´Â Bean
 * ÆäÀÌÂ¡ Ã³¸® °ü·Ã º¯¼ö Æ÷ÇÔ
*/

public class SearchVO {
	
	private int user_no = 0;
	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	/** °Ë»öÁ¶°Ç */
	private String searchCondition = "";
	
	/** °Ë»öÅ°¿öµå */
	private String searchKeyword = "";
    
	/** °Ë»ö »ç¿ë¿©ºÎ */
	private String searchUseYn = "";
	
	/** ÇöÀç ÆäÀÌÁö */
	private int currentPage = 1;
	
    
    /**ºí·°´ç º¸¿©Áú ÆäÀÌÁö ¼ö,  ÆäÀÌÁö »çÀÌÁî */
    private int blockSize; // properties¿¡¼­ ¼³Á¤
    
    /** ½ÃÀÛ ÀÎµ¦½º */
    private int firstRecordIndex = 1;
    
    /** ³¡ ÀÎµ¦½º */
    private int lastRecordIndex = 1;
    
<<<<<<< HEAD
    /**íŽ˜ì´ì§€ ë³„ ë ˆì½”ë“œ ê°¯ìˆ˜ (pageSize) */
    private int recordCountPerPage;
=======
    /**ÆäÀÌÁö º° ·¹ÄÚµå °¹¼ö (pageSize) */
    private int recordCountPerPage; 
>>>>>>> branch 'master' of https://github.com/ezenTuor/ezenTour.git
    
   /**
     * °Ë»ö Á¶°ÇÀ»  ¼³Á¤ÇÑ´Ù.
     * @param bean °Ë»öÁ¶°Ç
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
 