package com.ezen.tour.review.model;

import java.sql.Timestamp;

//review_view 입니당~
public class ReviewViewVO {
	private int reviewNo;
	private int userNo;
	private int historyNo;
	private String title;
	private String content;
	private int score;
	private Timestamp regdate;
	private String userId;
	private String name;
	private int packDno;
	private String packName;
	
	
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPackDno() {
		return packDno;
	}
	public void setPackDno(int packDno) {
		this.packDno = packDno;
	}
	public String getPackName() {
		return packName;
	}
	public void setPackName(String packName) {
		this.packName = packName;
	}
	
	
	@Override
	public String toString() {
		return "ReWiewVO [reviewNo=" + reviewNo + ", userNo=" + userNo + ", historyNo=" + historyNo + ", title=" + title
				+ ", content=" + content + ", score=" + score + ", regdate=" + regdate + ", userId=" + userId
				+ ", name=" + name + ", packDno=" + packDno + ", packName=" + packName + "]";
	}
}