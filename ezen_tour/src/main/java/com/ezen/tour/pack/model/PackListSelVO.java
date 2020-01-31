package com.ezen.tour.pack.model;

import java.util.List;

public class PackListSelVO {
	
	private List<String> keywordList;

	public List<String> getKeywordList() {
		return keywordList;
	}

	public void setKeywordList(List<String> keywordList) {
		this.keywordList = keywordList;
	}

	@Override
	public String toString() {
		return "packListSelVO [keywordList=" + keywordList + "]";
	}
	
	

}
