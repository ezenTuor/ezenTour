package com.ezen.tour.myPage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.tour.coupon.model.CouponService;
import com.ezen.tour.member.model.MemberService;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	private static final Logger logger
		=LoggerFactory.getLogger(MyPageController.class);
	
	@Autowired
	private CouponService couponService;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/coupon.do")
	public void couponList(HttpSession session, Model model) {
		String user_id=(String) session.getAttribute("user_id");
		int user_no = memberService.selectUser_no(user_id);
		
		logger.info("장바구니 목록, 파라미터 user_id={}", user_id);
		
		List<Map<String, Object>> list=couponService.selectUsefulCoupon(user_no);
		logger.info("장바구니 목록 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);		
	} 
}
