package com.ezen.tour.payment.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.tour.member.model.MemberService;
import com.ezen.tour.member.model.MemberVO;
import com.ezen.tour.payment.model.PaymentService;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	public static final Logger logger
		=LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private PaymentService paymentService; 
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/payment.do")
	public void payment(Model model, MemberVO vo,HttpServletRequest request) {
		logger.info("결제화면 보여주기");
		HttpSession session=request.getSession();
		String userId=(String)session.getAttribute("user_id");
		String userNo=(String)session.getAttribute("user_no");
		//테스트용
		userId="hong";
		userNo="1";
		
		vo=memberService.selectMember(userId);
		model.addAttribute("memeberVo", vo);
		
	}
	
	
}
