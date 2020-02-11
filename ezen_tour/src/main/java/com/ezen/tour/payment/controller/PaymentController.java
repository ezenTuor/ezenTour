package com.ezen.tour.payment.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.tour.history.model.HistoryService;
import com.ezen.tour.history.model.HistoryVO;
import com.ezen.tour.member.model.MemberService;
import com.ezen.tour.member.model.MemberVO;
import com.ezen.tour.payment.model.PaymentService;
import com.ezen.tour.payment.model.PaymentVO;
import com.ezen.tour.wishList.model.WishListService;
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
	
	@Autowired
	private HistoryService historyService;
	
	@Autowired
	private WishListService wishListService;
	
	@RequestMapping("/payment.do")
	public void payment(@RequestParam String nums, Model model, HttpServletRequest request) {	//번호가져오기
		logger.info("결제화면 보여주기");
		HttpSession session=request.getSession();
		String userId=(String)session.getAttribute("userId");
		

		MemberVO memberVo=memberService.selectMember(userId);
		
		//int userNo=(Integer)session.getAttribute("userNo");
		//List<WishListViewVO> list=wishListViewService.selectWishListView(userNo);
		
		List<WishListViewVO> list=new ArrayList<WishListViewVO>();
		String[] sArr=nums.split("\\|");
		for(int i=0;i<sArr.length;i++) {
			String temp=sArr[i];
			int no=Integer.parseInt(temp);
			
			WishListViewVO vo=wishListViewService.selectWish(no);
			list.add(vo);
		}
		
		String title="";
		int totalPrice=0;
		String details="";
		
		for(WishListViewVO viewVo : list) {
			details+="<p>이름-"+viewVo.getName()+" 상세번호-"+viewVo.getPackDno()+"</p><p>성인-"+viewVo.getMan()+" 아동-"+viewVo.getChild()+" 유아-"+viewVo.getBaby()+"</p>";
			totalPrice+=viewVo.getPrice();
			title+=viewVo.getName()+" ";
		}
		System.out.println(details);
		System.out.println(totalPrice);
		System.out.println(title);
		
		System.out.println(memberVo);
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("details", details);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("title", title);
		model.addAttribute("nums", nums);
	}
	
	
	@RequestMapping("/paymentInsert.do")
	public String insert(@ModelAttribute PaymentVO vo, @RequestParam String nums, HttpServletRequest request) {
		logger.info("결제db 입력 파라미터 vo={}", vo);
		
		int cnt=paymentService.insertPayment(vo);
	
		logger.info("결제 db 입력 결과 cnt={}", cnt);
		
		HttpSession session=request.getSession();
		int userNo=(Integer)session.getAttribute("userNo");
		
		String[] sArr=nums.split("\\|");
		for(int i=0; i<sArr.length; i++){
			String temp=sArr[i];
			int no=Integer.parseInt(temp);

			WishListViewVO wishVo=wishListViewService.selectWish(no);

			HistoryVO hisVo=new HistoryVO();
			hisVo.setUserNo(userNo);
			hisVo.setPackDno(wishVo.getPackDno());
			hisVo.setPaymentNo(vo.getPaymentNo());
			hisVo.setPrice(wishVo.getPrice());

			int cnt2=historyService.insertHistory(hisVo);
			logger.info("이용내역 db 입력 결과 i={}, cnt2={}", i, cnt2);
			
			int cnt3=wishListService.deleteWish(no);
			logger.info("찜목록 삭제 결과 cnt={}", cnt3);
		}
		
		
		return "index";
	}
	
	@RequestMapping("/payment2.do")
	public void payment2() {
		logger.info("테스트");
	}
	
}
