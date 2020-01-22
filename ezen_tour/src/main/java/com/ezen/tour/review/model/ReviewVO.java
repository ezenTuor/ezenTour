package com.ezen.tour.review.model;

import java.sql.Timestamp;

public class ReviewVO {
	private int review_no; //글번호
	private int user_no; //회원번호
	private int history_no; //내역번호
	private String title; //글제목
	//private int pd_number; //분류번호(보류)
	private String content; //글내용
	private int score; //별점
	private Timestamp regdate; //작성일
	
	
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getHistory_no() {
		return history_no;
	}
	public void setHistory_no(int history_no) {
		this.history_no = history_no;
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
		return "ReviewVO [review_no=" + review_no + ", user_no=" + user_no + ", history_no=" + history_no + ", title="
				+ title + ", content=" + content + ", score=" + score + ", regdate=" + regdate + "]";
	}
}