package com.ezen.tour.review.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.tour.review.model.ReviewService;
import com.ezen.tour.review.model.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	private static final Logger logger=LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public void write_get() {
		logger.info("리뷰 작성 화면 보여주기");
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute ReviewVO vo) {
		logger.info("리뷰 작성하기, 파라미터={}", vo);
		
		int cnt=reviewService.insertReview(vo);
		logger.info("작성 결과={}", cnt);
		
		if(cnt>0) {
			//성공
			return "redirect:/review/list.do";
		}else {
			//실패
			return "redirect:/review/write.do";
		}
	}

	@RequestMapping("/list.do")
	public void list() {
		logger.info("리뷰 목록 화면");
	}
}