package com.ezen.tour.myPage.controller;

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

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.coupon.model.CouponService;
import com.ezen.tour.coupon.model.CouponVO;
import com.ezen.tour.member.model.MemberService;
import com.ezen.tour.member.model.MemberVO;
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
	private MemberService memberService;
	
	@RequestMapping("/coupon.do")
	public String couponList(@ModelAttribute SearchVO searchVo
		,HttpSession session, Model model) {
		String user_id=(String) session.getAttribute("user_id");
		//int user_no = memberService.selectUser_no(user_id);
		int user_no = 1;
		//1
		logger.info("글 목록, 파라미터 searchVo={}",searchVo);
				
		//[1] 먼저 PaginationInfo객체를 생성하여 firstRecordIndex 값을 구한다
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] searchVo에 recordCountPerPage와 firstRecordIndex를 셋팅한다
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setUser_no(user_no);
		logger.info("값 셋팅 후 searchVo={}", searchVo);
		
		//2
		List<CouponVO> list=couponService.selectAll(searchVo);
		logger.info("글목록 결과, list.size={}", list.size());
		
		//[3] 레코드 개수 조회후 셋팅
		int totalRecord=couponService.selectTotalRecord(user_no);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
			
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//[1] 먼저 PaginationInfo객체를 생성하여 firstRecordIndex 값을 구한다
				PaginationInfo N_pagingInfo=new PaginationInfo();
				N_pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
				N_pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
				N_pagingInfo.setCurrentPage(searchVo.getCurrentPage());
				
				//[2] searchVo에 recordCountPerPage와 firstRecordIndex를 셋팅한다
				searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
				searchVo.setFirstRecordIndex(N_pagingInfo.getFirstRecordIndex());
				searchVo.setUser_no(user_no);
				logger.info("값 셋팅 후 searchVo={}", searchVo);
				
				//2
				List<CouponVO> N_list=couponService.selectAll_N(searchVo);
				logger.info("글목록 결과, list.size={}", N_list.size());
				
				//[3] 레코드 개수 조회후 셋팅
				int N_totalRecord=couponService.selectTotalRecord_N(user_no);
				logger.info("totalRecord={}", N_totalRecord);
				
				N_pagingInfo.setTotalRecord(N_totalRecord);
					
				//3
				model.addAttribute("N_list", N_list);
				model.addAttribute("N_pagingInfo", N_pagingInfo);
		return "myPage/coupon";
	}
}
