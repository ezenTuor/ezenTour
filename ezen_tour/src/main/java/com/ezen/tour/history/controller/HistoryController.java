package com.ezen.tour.history.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.tour.history.model.HistoryService;
import com.ezen.tour.history.model.HistoryViewVO;

@Controller
@RequestMapping("/history")
public class HistoryController {
	private static final Logger logger=LoggerFactory.getLogger(HistoryController.class);
	
	@Autowired
	private HistoryService historyService;
	
	@RequestMapping("/historyList.do")
	public String list_get(Model model, HttpSession session) {
		String userId=(String)session.getAttribute("userId");
		int userNo=(Integer)session.getAttribute("userNo");
		logger.info("이용내역 화면, 접속된 아이디={}, 회원번호={}", userId, userNo);
		
		if(userId==null || userId.isEmpty()) {
			model.addAttribute("msg", "로그인 후 작성 가능합니다.");
			model.addAttribute("url", "/member/login.do");
			
			return "common/message";
		}
		
		List<HistoryViewVO> list=historyService.selectAll(userNo);
		logger.info("이용내역 조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
		
		return "history/historyList";
	}
	
}