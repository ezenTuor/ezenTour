package com.ezen.tour.support.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.tour.common.PaginationInfo;
import com.ezen.tour.common.Utility;
import com.ezen.tour.member.controller.MemberController;
import com.ezen.tour.member.model.MemberService;
import com.ezen.tour.member.model.MemberVO;
import com.ezen.tour.support.model.SupportService;
import com.ezen.tour.support.model.SupportVO;
import com.ezen.tour.support.model.SupportViewVO;

@Controller
@RequestMapping("/support")
public class SupportController {
	private static final Logger logger
	=LoggerFactory.getLogger(MemberController.class);
	@Autowired
	private SupportService supportService;
	@Autowired
	private MemberService memberService;
	
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
		
		List<SupportViewVO> list=supportService.selectAll(vo);
		logger.info("글목록 결과, list.size={}", list.size());
		for(SupportViewVO viewvo:list) {
			System.out.println("viewvo="+viewvo);
		}
		
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
	public String writeSupport_post(@ModelAttribute SupportVO vo,HttpSession session
			,Model model) {
		logger.info("건의사항 작성 페이지 처리");
		int userNo = (Integer)session.getAttribute("userNo");
		String msg = "", url = "";
		vo.setUserNo(userNo);
		int result = supportService.insertSupport(vo);
		if(result >0) {
			msg = "건의사항이 등록되었습니다.";
			url = "/support/support.do";
		}else {
			msg = "건의사항 등록이 실패하였습니다.";
			url = "/support/writeSupport.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	@RequestMapping("/supportDetail.do")
	public String readDetail(@RequestParam(defaultValue = "0") int supportNo,
			@RequestParam(defaultValue = "0") int groupNo, Model model) {
		logger.info("상세보기 파라미터, no={}", supportNo);
		if(supportNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/support/support.do");
			
			return "common/message";
		}
		
		SupportViewVO supportViewVo=supportService.selectSupportByNo(supportNo);
		logger.info("상세보기 결과, vo={}", supportViewVo);
		Map<String, Object> map = new HashMap<String, Object>();
		String userId = memberService.findUserIdByUserNo(supportViewVo.getUserNo());
		List<SupportVO> list = new ArrayList<SupportVO>();
		
		list = supportService.selectReply(groupNo);
				
		map.put("title", supportViewVo.getTitle());
		map.put("userId", userId);
		map.put("regdate", supportViewVo.getRegdate());
		map.put("content", supportViewVo.getContent());
		
		model.addAttribute("list",list);
		model.addAttribute("map",map);
		model.addAttribute("supportNo", supportNo);
		return "support/supportDetail";
	}
	@RequestMapping(value="/supportEdit.do", method =RequestMethod.GET)
	public String edit_get(@ModelAttribute SupportVO vo,
			Model model) {
		int supportNo = vo.getSupportNo();
		logger.info("수정화면 파라미터 supportNo={}",supportNo);		
		if(supportNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/support/support.do");
			
			return "common/message";
		}
		
		SupportViewVO supportViewVo =supportService.selectByNo(supportNo);
		logger.info("수정화면 결과, supportVo={}", supportViewVo);
		
		model.addAttribute("supportVo", supportViewVo);
		
		return "support/supportEdit";
	}
	
	@RequestMapping(value="/supportEdit.do", method = RequestMethod.POST)
	public String edit_post(@ModelAttribute SupportVO supportVo, Model model){
		logger.info("글 수정 처리, 파라미터 vo={}");
		
		String msg="", url="/support/supportEdit.do?supportNo="+supportVo.getSupportNo();
		
		int cnt=supportService.editSupport(supportVo);
		if(cnt>0) {
			msg="글 수정되었습니다.";
			url="/support/supportDetail.do?supportNo="+supportVo.getSupportNo();
		}else {
			msg="글 수정 실패!";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	@RequestMapping("/mySupport.do")
	public String mySupportSelect(@ModelAttribute MemberVO vo, Model model) {
		logger.info("건의 사항 목록 띄우기");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		vo.setFirstRecordIndex(vo.getFirstRecordIndex());
		
		logger.info("값 셋팅 후 searchVo={}", vo);
		
		List<SupportViewVO> list=supportService.selectmySupport(vo);
		logger.info("글목록 결과, list.size={}", list.size());
		
		int totalRecord=supportService.selectTotalRecord(vo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "support/mySupport";
	}
}
