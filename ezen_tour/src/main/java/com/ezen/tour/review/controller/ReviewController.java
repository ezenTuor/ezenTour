package com.ezen.tour.review.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/review")
public class ReviewController {
	private static final Logger logger=LoggerFactory.getLogger(ReviewController.class);
	
	@RequestMapping("/write.do")
	public void write() {
		logger.info("리뷰 작성 화면");
	}
	
	@RequestMapping("/list.do")
	public void list() {
		logger.info("리뷰 목록 화면");
	}
}