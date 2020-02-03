package com.ezen.tour.review.model;

import java.sql.Timestamp;

public class ReviewVO {
	private int reviewNo; //글번호
	private int userNo; //회원번호
	private int historyNo; //내역번호
	private String title; //글제목
	private String content; //글내용
	private int score; //별점
	private Timestamp regdate; //작성일
	
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(int historyNo) {
		this.historyNo = historyNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", userNo=" + userNo + ", historyNo=" + historyNo + ", title=" + title
				+ ", content=" + content + ", score=" + score + ", regdate=" + regdate + "]";
	}
}