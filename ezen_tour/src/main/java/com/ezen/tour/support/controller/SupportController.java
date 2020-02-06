package com.ezen.tour.support.controller;

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
import com.ezen.tour.common.Utility;
import com.ezen.tour.member.controller.MemberController;
import com.ezen.tour.member.model.MemberVO;
import com.ezen.tour.support.model.SupportService;
import com.ezen.tour.support.model.SupportVO;

@Controller
@RequestMapping("/support")
public class SupportController {
	private static final Logger logger
	=LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private SupportService supportService;
	
	@RequestMapping("/support.do")
	public String allSelect(@ModelAttribute MemberVO vo, Model model) {
		logger.info("건의 사항 목록 띄우기");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		vo.setFirstRecordIndex(vo.getFirstRecordIndex());
		
		logger.info("값 셋팅 후 searchVo={}", vo);
		
		List<SupportVO> list=supportService.selectAll(vo);
		logger.info("글목록 결과, list.size={}", list.size());
		
		int totalRecord=supportService.selectTotalRecord(vo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "support/support";
	}
	@RequestMapping(value = "/writeSupport.do", method = RequestMethod.GET)
	public String writeSupport_get() {
		logger.info("건의사항 작성 페이지 띄우기");
		
		return "support/writeSupport";
	}
	
	@RequestMapping(value = "/writeSupport.do", method = RequestMethod.POST)
	public String writeSupport_post(@ModelAttribute SupportVO vo, Model model) {
		logger.info("건의사항 작성 페이지 처리");
		
		String msg = "", url = "";
		int result = supportService.insertSupport(vo);
		if(result >0) {
			msg = "건의사항이 등록되었습니다.";
			url = "support/support.do";
		}else {
			msg = "건의사항 등록이 실패하였습니다.";
			url = "support/writeSupport.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	@RequestMapping("/supportDetail.do")
	public String readDetail(@RequestParam(defaultValue = "0") int supportNo,
			Model model) {
		logger.info("상세보기 파라미터, no={}", supportNo);
		if(supportNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/support/support.do");
			
			return "common/message";
		}
		
		SupportVO supportVo=supportService.selectSupportByNo(supportNo);
		logger.info("상세보기 결과, vo={}", supportVo);
		
		
		model.addAttribute("vo", supportVo);
		
		return "support/supportDetail";
	} 
}
