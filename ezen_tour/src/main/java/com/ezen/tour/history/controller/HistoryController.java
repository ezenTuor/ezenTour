package com.ezen.tour.history.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.tour.history.model.HistoryService;
import com.ezen.tour.history.model.HistoryVO;

@Controller
@RequestMapping("/history")
public class HistoryController {
	private static final Logger logger=LoggerFactory.getLogger(HistoryController.class);
	
	@Autowired
	private HistoryService historyService;
	
	@RequestMapping("/historyList.do")
	public void list_get(Model model) {
		logger.info("이용내역 화면 출력");
		
		List<HistoryVO> list=historyService.selectAll();
		logger.info("이용내역 조회 결과, list.size()={}", list.size());
		
		model.addAttribute("list", list);
	}
}