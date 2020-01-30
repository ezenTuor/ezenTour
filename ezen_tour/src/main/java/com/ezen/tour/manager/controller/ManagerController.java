package com.ezen.tour.manager.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.tour.manager.areadetail.model.AreaDetailService;
import com.ezen.tour.manager.areadetail.model.ManagerAreaDetailVO;

@Controller
@RequestMapping("/manager")
public class ManagerController{
	private Logger logger=LoggerFactory.getLogger(ManagerController.class);
		
	@Autowired
	private AreaDetailService areaDetailService;

	@RequestMapping("/managerMain.do")
	public String adminMain() {
		logger.info("관리자 메인 화면 보여주기");
		return "manager/managerMain";
	}
	
	@RequestMapping("/area.do")
	@ResponseBody
	public List<ManagerAreaDetailVO> area(@RequestParam int no){
		logger.info("area 디테일 처리, 파라미터 no={}",no);
		//[{"tagNo":1,"areaNo":1,"name":"서유럽","keyword":"서유럽|영국|프랑스|이태리"},...
		return areaDetailService.selectAreaDetail(no);
	}
	
	@RequestMapping("/test.do")
	public String test() {
		logger.info("테스트");
		return "manager/test";
	}
	
}
