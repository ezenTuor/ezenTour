package com.ezen.tour.pack.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PackageAjaxController {
	private static final Logger logger
		= LoggerFactory.getLogger(PackageAjaxController.class);
	
	@RequestMapping("/areaPack.do")
	@ResponseBody
	public void areaPack(String areaC){
		logger.info("에이젝스 화면 임시={}", areaC);
	}
	
	
}
