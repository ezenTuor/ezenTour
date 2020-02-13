package com.ezen.tour.myPage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.coupon.model.CouponService;
import com.ezen.tour.coupon.model.CouponVO;
import com.ezen.tour.couponView.model.CouponViewService;
import com.ezen.tour.couponView.model.CouponViewVO;
import com.ezen.tour.member.model.MemberService;
import com.ezen.tour.member.model.MemberVO;
import com.ezen.tour.mileage.model.MileageService;
import com.ezen.tour.mileage.model.MileageVO;
import com.ezen.tour.payment.model.PaymentService;
import com.ezen.tour.payment.model.PaymentVO;
import com.ezen.tour.wishList.model.WishListService;
import com.ezen.tour.wishList.model.WishListVO;
import com.ezen.tour.wishListView.model.WishListViewVO;
import com.ezen.tour.common.PaginationInfo;
import com.ezen.tour.common.Utility;

@Controller
@RequestMapping("/myPage")
public class MyPageController {
	private static final Logger logger
		=LoggerFactory.getLogger(MyPageController.class);
	@Autowired
	private CouponService couponService;
	@Autowired
	private CouponViewService couponViewService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private MileageService mileageService;
	@Autowired
	private WishListService wishListService;
	@Autowired
	private PaymentService paymentService;
	
	@RequestMapping("/coupon.do")
	public String couponList(@ModelAttribute MemberVO memberVo
		,HttpSession session, Model model) {
		String userId=(String) session.getAttribute("userId");
		int userNo = memberService.selectUserNo(userId);
		//int user_no = 1;
		//1
		logger.info("글 목록, 파라미터 searchVo={}",memberVo);
				
		//[1] 먼저 PaginationInfo객체를 생성하여 firstRecordIndex 값을 구한다
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(memberVo.getCurrentPage());
		
		//[2] searchVo에 recordCountPerPage와 firstRecordIndex를 셋팅한다
		memberVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		memberVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		memberVo.setUserNo(userNo);
		logger.info("값 셋팅 후 searchVo={}", memberVo);
		
		//2
		List<CouponViewVO> list=couponViewService.selectAll(memberVo);
		logger.info("글목록 결과, list.size={}", list.size());
		
		//[3] 레코드 개수 조회후 셋팅
		int totalRecord=couponViewService.selectTotalRecord(userNo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
			
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//[1] 먼저 PaginationInfo객체를 생성하여 firstRecordIndex 값을 구한다
		PaginationInfo N_pagingInfo=new PaginationInfo();
		N_pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		N_pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		N_pagingInfo.setCurrentPage(memberVo.getCurrentPage());
				
		//[2] searchVo에 recordCountPerPage와 firstRecordIndex를 셋팅한다
		memberVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		memberVo.setFirstRecordIndex(N_pagingInfo.getFirstRecordIndex());
		memberVo.setUserNo(userNo);
		logger.info("값 셋팅 후 searchVo={}", memberVo);
				
		//2
		List<CouponViewVO> N_list=couponViewService.selectAll_N(memberVo);
		logger.info("글목록 결과, list.size={}", N_list.size());
				
		//[3] 레코드 개수 조회후 셋팅
		int N_totalRecord=couponViewService.selectTotalRecord_N(userNo);
		logger.info("totalRecord={}", N_totalRecord);
				
		N_pagingInfo.setTotalRecord(N_totalRecord);
					
		//3
		model.addAttribute("N_list", N_list);
		model.addAttribute("N_pagingInfo", N_pagingInfo);
		return "myPage/coupon";
	}
	@RequestMapping("/mileage.do")
	public String mileageList(@ModelAttribute MemberVO memberVo
		,HttpSession session, Model model) {
		String userId=(String) session.getAttribute("userId");
		int userNo = memberService.selectUserNo(userId);
		//1
		logger.info("글 목록, 파라미터 searchVo={}",memberVo);
				
		//[1] 먼저 PaginationInfo객체를 생성하여 firstRecordIndex 값을 구한다
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(memberVo.getCurrentPage());
		
		//[2] searchVo에 recordCountPerPage와 firstRecordIndex를 셋팅한다
		memberVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		memberVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		memberVo.setUserNo(userNo);
		logger.info("값 셋팅 후 searchVo={}", memberVo);
		
		//2
		List<MileageVO> list=mileageService.selectAll(memberVo);
		logger.info("글목록 결과, list.size={}", list.size());
		
		//[3] 레코드 개수 조회후 셋팅
		int totalRecord=mileageService.selectTotalRecord(userNo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
			
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "myPage/mileage";
	}
	@RequestMapping("/wishList.do")
	public String wishListSelect(HttpSession session, Model model,
			MemberVO memberVo) {
		logger.info("위시리스트 띄우기 처리");
		int userNo = (Integer)session.getAttribute("userNo");
		
		memberVo.setUserNo(userNo);
		//[1] 먼저 PaginationInfo객체를 생성하여 firstRecordIndex 값을 구한다
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(memberVo.getCurrentPage());
				
		//[2] searchVo에 recordCountPerPage와 firstRecordIndex를 셋팅한다
		memberVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		memberVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		memberVo.setUserNo(userNo);
		logger.info("값 셋팅 후 searchVo={}", memberVo);
		
		//2
		List<WishListViewVO> list = wishListService.selectWishList(memberVo);
		logger.info("글목록 결과, list.size={}", list.size());
		
		//[3] 레코드 개수 조회후 셋팅
		int totalRecord=mileageService.selectTotalRecord(userNo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
			
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "myPage/wishList";
	}
	@RequestMapping("/payment")
	public String paymentSelect(HttpSession session, Model model,
			@ModelAttribute MemberVO memberVo) {
		logger.info("결제내역 띄우기 처리, 파라미터 memberVo={}", memberVo);
		int userNo = (Integer)session.getAttribute("userNo");
		System.out.println("디버깅중 - userNo="+userNo);
		
		memberVo.setUserNo(userNo);
		//[1] 먼저 PaginationInfo객체를 생성하여 firstRecordIndex 값을 구한다
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(memberVo.getCurrentPage());

		//[2] searchVo에 recordCountPerPage와 firstRecordIndex를 셋팅한다
		memberVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		memberVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		memberVo.setUserNo(userNo);
		logger.info("값 셋팅 후 memberVo={}", memberVo);

		//2
		List<PaymentVO> list = paymentService.selectAll(memberVo);
		logger.info("글목록 결과, list.size={}", list.size());
		
		//[3] 레코드 개수 조회후 셋팅
		int totalRecord=mileageService.selectTotalRecord(userNo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
			
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "myPage/payment";
	}
	@RequestMapping("/paymentDetail")
	public String paymentDetail(int paymentNo) {
		return "redirect:/myPage/paymentDetail.do?no="+paymentNo;		
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam(defaultValue = "0") int paymentNo,
			Model model) {
		logger.info("상세보기 파라미터, no={}", paymentNo);
		if(paymentNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/mypage/payment.do");
			
			return "common/message";
		}
		PaymentVO paymentVo = new PaymentVO();
		Map<String, Object> map = new HashMap<String, Object>();
		String userId = memberService.findUserIdByUserNo(paymentNo);

		map.put("userId", userId);
		map.put("regdate", paymentVo.getRegdate());
		map.put("content", paymentVo.getDetail());
		
		model.addAttribute("map",map);
		return "myPage/detail";
	}
}
