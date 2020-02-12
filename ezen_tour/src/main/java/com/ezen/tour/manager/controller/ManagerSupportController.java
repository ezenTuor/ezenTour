package com.ezen.tour.manager.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.tour.common.PaginationInfo;
import com.ezen.tour.common.SearchVO;
import com.ezen.tour.common.Utility;
import com.ezen.tour.support.model.SupportService;
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
}
