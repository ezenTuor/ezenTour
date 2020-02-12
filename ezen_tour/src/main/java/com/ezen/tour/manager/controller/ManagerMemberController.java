package com.ezen.tour.manager.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.tour.common.PaginationInfo;
import com.ezen.tour.common.SearchVO;
import com.ezen.tour.common.Utility;
import com.ezen.tour.coupon.model.CouponService;
import com.ezen.tour.coupon.model.CouponVO;
import com.ezen.tour.member.model.MemberService;
import com.ezen.tour.member.model.MemberVO;
import com.ezen.tour.mileage.model.MileageService;
import com.ezen.tour.mileage.model.MileageVO;

@Controller
@RequestMapping("/manager/member")
public class ManagerMemberController {
	private Logger logger=LoggerFactory.getLogger(ManagerMemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MileageService mileageService;
	
	@Autowired
	private CouponService couponService;
	
	@RequestMapping("/memberList.do")
	public void memberList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("회원 목록 보여주기, 파라미터 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setBlockSize(Utility.MEMBER_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		logger.info("값 세팅 후 searchVo={}", searchVo);
		
		List<MemberVO> list=memberService.selectAll(searchVo);
		logger.info("회원목록 list.size={}",list.size());
		
		int totalRecord=memberService.selectTotal(searchVo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("list", list);
	}
	
	@RequestMapping("/memberDetail.do")
	public void memberDetail(@RequestParam String userId, Model model) {
		logger.info("관리자 - 회원정보 조회, 파라미터 userId={}", userId);
		
		MemberVO memberVo=memberService.selectMember(userId);
		logger.info("멤버 조회 결과 memberVo={}", memberVo);
		
		model.addAttribute("memberVo", memberVo);
	}
	
	@RequestMapping("/mileage.do")
	public void mileageList(@ModelAttribute SearchVO searchVo, @RequestParam String userId, Model model) {
		logger.info("유저 마일리지 보여주기, 파라미터 searchVo={}, userId={}", searchVo, userId);
		MemberVO memberVo=memberService.selectUser(userId);
		
		//[1] 먼저 PaginationInfo객체를 생성하여 firstRecordIndex 값을 구한다
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] searchVo에 recordCountPerPage와 firstRecordIndex를 셋팅한다
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setUserNo(memberVo.getUserNo());
		logger.info("값 셋팅 후 searchVo={}", searchVo);
		
		//2
		List<MileageVO> list=mileageService.selectAll(searchVo);
		logger.info("마일리지 조회 결과, list.size={}", list.size());
		
		//[3] 레코드 개수 조회후 셋팅
		int totalRecord=mileageService.selectTotalRecord(searchVo.getUserNo());
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
			
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("memberVo", memberVo);
	}
	@RequestMapping("/coupon.do")
	public void coupon(@ModelAttribute SearchVO searchVo, @RequestParam String userId, Model model) {
		logger.info("유저 쿠폰 보여주기, 파라미터 searchVo={}, userId={}", searchVo, userId);
		MemberVO memberVo=memberService.selectUser(userId);
		
		//[1] 먼저 PaginationInfo객체를 생성하여 firstRecordIndex 값을 구한다
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		//[2] searchVo에 recordCountPerPage와 firstRecordIndex를 셋팅한다
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setUserNo(memberVo.getUserNo());
		logger.info("값 셋팅 후 searchVo={}", searchVo);
		
		//2
		List<CouponVO> list=couponService.selectAll(searchVo);
		logger.info("쿠폰 조회 결과, list.size={}", list.size());
		
		//[3] 레코드 개수 조회후 셋팅
		int totalRecord=couponService.selectTotalRecord(searchVo.getUserNo());
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
			
		//3
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("memberVo", memberVo);
	}
}
