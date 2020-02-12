package com.ezen.tour.manager.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.tour.common.PaginationInfo;
import com.ezen.tour.common.SearchVO;
import com.ezen.tour.common.Utility;
import com.ezen.tour.manager.cupon.model.ManagerCuponAdminService;
import com.ezen.tour.manager.cupon.model.ManagerCuponAdminVO;

@Controller
@RequestMapping("/manager/cupon")
public class ManagerCuponController {
	private Logger logger=LoggerFactory.getLogger(ManagerCuponController.class);
	
	@Autowired
	private ManagerCuponAdminService managerCuponAdminService;
	
	@RequestMapping("/cuponList.do")
	public void cuponList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("쿠폰(관리자) 목록 보여주기 , 파라미터 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setBlockSize(Utility.MEMBER_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		logger.info("값 세팅 후 searchVo={}", searchVo);
		
		List<ManagerCuponAdminVO> list=managerCuponAdminService.selectAdmin(searchVo);
		logger.info("쿠폰 목록 list.size={}",list.size());
		
		int totalRecord=managerCuponAdminService.selectAdminTotal(searchVo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/cuponWrite.do", method = RequestMethod.GET)
	public void cuponWrite_get() {
		logger.info("쿠폰 입력(관리자) 화면 보여주기");
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/cuponWrite.do", method=RequestMethod.POST)
	public String cuponWrite_post(ManagerCuponAdminVO managerCuponAdminVo, Model model) {
		logger.info("쿠폰 입력(관리자) 입력처리, 파라미터 managerCuponAdminVo={}", managerCuponAdminVo);
		
		//만료 타입 처리
		String delType=managerCuponAdminVo.getDelType();
		String deldate=managerCuponAdminVo.getDeldate();
		if(delType.equals("A")){
			logger.info("만료타입, 날짜형 deldate={}", deldate);
		}else if(delType.equals("R")) {
			logger.info("만료타입, 기간형 deldate={}", deldate);
			
			Date date=new Date(2020-1900, 0, 1);//2020년 1월 1일
			int delgap=Integer.parseInt(deldate);
			
			/*
			long mils=delgap*1000*60*60*24;//밀리세컨드 형태로 바꾸기
			long standard=date.getTime();
			
			System.out.println("delgap="+delgap);
			System.out.println("mils="+mils);
			System.out.println("stand="+standard);
			System.out.println(date.toLocaleString());
			
			date.setTime(mils+standard);
			*/
			date.setDate(date.getDate()+delgap);
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd");
			deldate=sdf.format(date);
			logger.info("계산한 만료날짜, deldate={}", deldate);
		}
		managerCuponAdminVo.setDeldate(deldate);
		//만료타입 처리 완료
		
		int cnt=managerCuponAdminService.insertAdmin(managerCuponAdminVo);
		
		String msg="", url="";
		if(cnt>0) {
			msg="쿠폰이 입력되었습니다.";
			url="/manager/cupon/cuponList.do";
		}else {
			msg="쿠폰이 입력 실패!";
			url="/manager/cupon/cuponWrite.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/cuponDelete.do")
	public String delCupon(@RequestParam String delNums, Model model){
		logger.info("쿠폰 삭제 처리 - 관리자, 파라미터 delNums={}", delNums);
		
		int result=managerCuponAdminService.deleteAdmin(delNums);
		
		model.addAttribute("msg", result+"개가 삭제처리 되었습니다.");
		model.addAttribute("url", "/manager/cupon/cuponList.do");
		
		return "common/message";
	}
}
