package com.ezen.tour.common;

import java.util.Random;

public class Utility {
	//페이징 처리 관련 상수
	public static final int BLOCK_SIZE=5;
	public static final int RECORD_COUNT=10;
	public static final int ZIPCODE_RECORD_COUNT=15;
	public static final int MEMBER_SIZE=20;
	
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
	public static String randomNum() {
		char[] charaters = {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p',
				'q','r','s','t','u','v','w','x','y','z',
				'0','1','2','3','4','5','6','7','8','9'};
		StringBuffer sb = new StringBuffer();
        Random rn = new Random();
        for( int i = 0 ; i < 12 ; i++ ){
        	sb.append(charaters[rn.nextInt(charaters.length)]);
        }
        return sb.toString();
	}
	
}
