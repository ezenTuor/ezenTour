package com.ezen.tour.common;

public class Utility {
	//페이징 처리 관련 상수
	public static final int BLOCK_SIZE=10;
	public static final int RECORD_COUNT=5;
	public static final int ZIPCODE_RECORD_COUNT=15;
	
	public static String getFileInfo(String originalFileName,
			long fileSize) {
		//파일정보 리턴해주는 메서드
		String fileInfo="";
		
		if(originalFileName!=null && !originalFileName.isEmpty()) {
			float fSize=fileSize/1024f;
			fSize=Math.round(fSize*100)/100f;
			
			fileInfo=originalFileName+" ( "+ fSize+"KB )";
		}
		
		return fileInfo;
	}
	
	
}
