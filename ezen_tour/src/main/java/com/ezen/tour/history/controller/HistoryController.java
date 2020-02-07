package com.ezen.tour.history.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.tour.common.HistorySearchVO;
import com.ezen.tour.history.model.HistoryService;
import com.ezen.tour.history.model.HistoryViewVO;

@Controller
@RequestMapping("/history")
public class HistoryController {
	private static final Logger logger=LoggerFactory.getLogger(HistoryController.class);
	
	@Autowired
	private HistoryService historyService;
	
	@RequestMapping("/historyList.do")
	public String historyList(HttpSession session, Model model) {
		String userId=(String)session.getAttribute("userId");
		logger.info("이용내역 화면, 로그인 된 아이디={}", userId);
		
		if(userId==null || userId.isEmpty()) {
			model.addAttribute("msg", "로그인 후 작성 가능합니다.");
			model.addAttribute("url", "/member/login.do");
			
			return "common/message";
		}
		
		int userNo=(Integer)session.getAttribute("userNo");
	
		List<HistoryViewVO> list=historyService.selectHistory(userNo);
		logger.info("이용내역 조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
	
		return "history/historyList";
	}
	
	@RequestMapping("/historyAll.do")
	public String historyAll(HttpSession session, Model model) {
		String userId=(String)session.getAttribute("userId");
		if(userId==null || userId.isEmpty()) {
			model.addAttribute("msg", "로그인 후 작성 가능합니다.");
			model.addAttribute("url", "/member/login.do");
			
			return "common/message";
		}
		int userNo=(Integer)session.getAttribute("userNo");
		logger.info("이용내역 전체조회, 유저 번호={}", userNo);
		
		List<HistoryViewVO> list=historyService.selectAll(userNo);
		
		model.addAttribute("list", list);
		
		return "history/historyList";
	}
	
	@RequestMapping("/historyMtM.do")
	public String historySelect(@ModelAttribute HistorySearchVO vo, HttpSession session, Model model) {
		String userId=(String)session.getAttribute("userId");
		if(userId==null || userId.isEmpty()) {
			model.addAttribute("msg", "로그인 후 작성 가능합니다.");
			model.addAttribute("url", "/member/login.do");
			
			return "common/message";
		}
		logger.info("이용내역 날짜 조회={}", vo);
		logger.info("날짜 들어간 후={}", vo);
		int userNo=(Integer)session.getAttribute("userNo");
		vo.setUserNo(userNo);
		
		List<HistoryViewVO> list=historyService.selectMtoM(vo);
		logger.info("검색 결과 개수={}", list.size());
		
		model.addAttribute("list", list);
		
		return "history/historyList";
	}
	
}