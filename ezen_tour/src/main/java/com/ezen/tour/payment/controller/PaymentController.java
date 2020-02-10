package com.ezen.tour.payment.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.tour.member.model.MemberService;
import com.ezen.tour.member.model.MemberVO;
import com.ezen.tour.payment.model.PaymentService;
import com.ezen.tour.payment.model.PaymentVO;
import com.ezen.tour.wishListView.model.WishListViewService;
import com.ezen.tour.wishListView.model.WishListViewVO;

@Controller
@RequestMapping("/payment")
public class PaymentController {
	public static final Logger logger
		=LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private PaymentService paymentService; 
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private WishListViewService wishListViewService;
	
	@RequestMapping("/payment.do")
	public void payment(Model model, HttpServletRequest request) {
		logger.info("결제화면 보여주기 처리");
		HttpSession session=request.getSession();
		String userId=(String)session.getAttribute("userId");
		
		//테스트용
		/*
		 * userId="hong"; userNo="1";
		 */
		
		MemberVO memberVo=memberService.selectMember(userId);
		
		int userNo=(Integer)session.getAttribute("userNo");
		List<WishListViewVO> list=wishListViewService.selectWishListView(userNo);
		
		String title="";
		int totalPrice=0;
		String details="";
		int index=0;
		for(WishListViewVO viewVo : list) {
			details+="이름-"+viewVo.getName()+" 성인-"+viewVo.getMan()+" 아동-"+viewVo.getChild()+" 유아-"+viewVo.getBaby()+" 상세번호-"+viewVo.getPackDno();
			totalPrice+=viewVo.getPrice();
			title+=viewVo.getName()+" ";
			index++;
		}
		System.out.println(details);
		System.out.println(totalPrice);
		System.out.println(title);
		
		System.out.println(memberVo);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("details", details);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("title", title);
	}
	
	
	@RequestMapping("/paymentInsert.do")
	public String insert(@ModelAttribute PaymentVO vo) {
		logger.info("결제db 입력 파라미터 vo={}", vo);
		
		int cnt=paymentService.insertPayment(vo);
	
		logger.info("결제 db 입력 결과 cnt={}", cnt);
		
		return "index";
	}
	
}
