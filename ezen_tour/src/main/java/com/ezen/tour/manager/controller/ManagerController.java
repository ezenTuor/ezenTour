package com.ezen.tour.manager.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.tour.manager.areadetail.model.AreaDetailService;
import com.ezen.tour.manager.areadetail.model.ManagerAreaDetailVO;
import com.ezen.tour.manager.model.ManagerVO;

@Controller
@RequestMapping("/manager")
public class ManagerController{
	private Logger logger=LoggerFactory.getLogger(ManagerController.class);
		
	@Autowired
	private AreaDetailService areaDetailService;

	@RequestMapping("/managerMain.do")
	public String adminMain() {
		logger.info("매니저 메인화면 보여주기");
		return "manager/managerMain";
	}
	
	/*
	@RequestMapping("/managerLogin.do")
	public String adminLogin(@ModelAttribute ManagerVO managerVo) {
		logger.info("관리자 로그인 테스트");
		return 
	}
	*/
	
	@RequestMapping("/area.do")
	@ResponseBody
	public List<ManagerAreaDetailVO> area(@RequestParam int no){
		logger.info("area의 상세정보 읽어오기, 파라미터 no={}",no);
		return areaDetailService.selectAreaDetail(no);
	}
	
	@RequestMapping("/test.do")
	public String test() {
		logger.info("테스트");
		return "manager/test";
	}
	
}
