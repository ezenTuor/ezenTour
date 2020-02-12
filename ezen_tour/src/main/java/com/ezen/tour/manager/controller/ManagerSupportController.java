package com.ezen.tour.manager.controller;

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
import org.springframework.web.bind.annotation.RequestPart;

import com.ezen.tour.common.PaginationInfo;
import com.ezen.tour.common.SearchVO;
import com.ezen.tour.common.Utility;
import com.ezen.tour.support.model.SupportService;
import com.ezen.tour.support.model.SupportVO;
import com.ezen.tour.support.model.SupportViewVO;

@Controller
@RequestMapping("/manager/support")
public class ManagerSupportController {
	private Logger logger=LoggerFactory.getLogger(ManagerSupportController.class);
	
	@Autowired
	private SupportService supportService;
	
	@RequestMapping("/supportList.do")
	public void supportList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("건의사항 - 관리자 화면 처리, 파라미터 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		logger.info("값 세팅 후 searchVo={}", searchVo);
		
		List<SupportViewVO> list=supportService.selectAdmin(searchVo);
		logger.info("건의사항 조회 결괴 list.size={}", list.size());
		
		int totalRecord=supportService.selectAdminTotal(searchVo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("searchVo", searchVo);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/supportWrite.do", method = RequestMethod.GET)
	public void supportWrite(@RequestParam int supportNo, Model model) {
		logger.info("건의사항 - 관리자 작성 화면 처리, 파라미터 supportNo={}", supportNo);
		
		SupportViewVO supportViewVo=supportService.selectByNo(supportNo);
		logger.info("건의사항 조회 supportViewVo={}", supportViewVo);
		
		model.addAttribute("supportViewVo", supportViewVo);
	}
	@RequestMapping(value="/supportWrite.do", method=RequestMethod.POST)
	public String supportWrite_post(@ModelAttribute SupportVO supportVo, Model model) {
		logger.info("건의사항 작성 처리 - 관리자, 파라미터 supportVo={}", supportVo);
		supportVo.setSupportNo(0);
		
		int result=supportService.insertAdmin(supportVo);
		logger.info("답변 처리 결과 result={}", result);
		
		String msg="", url="";
		if(result>0) {
			msg="답변이 처리되었습니다.";
			url="/manager/support/supportList.do";
		}else {
			msg="답변처리 실패!";
			url="/manager/support/supportWrite.do?supportNo="+supportVo.getGroupNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	@RequestMapping("/supportDetail.do")
	public void supportDetail(@RequestParam int supportNo, Model model) {
		logger.info("건의사항 상세보기 처리, 파라미터 supportNo={}", supportNo);
		
		SupportViewVO supportViewVo=supportService.selectByNo(supportNo);
		SupportViewVO supportAdmin=supportService.selectRe(supportNo);
		logger.info("조회결과  문의={}, 답변={}", supportViewVo, supportAdmin);
		
		model.addAttribute("supportViewVo", supportViewVo);
		model.addAttribute("suportAdmin", supportAdmin);
	}
}
