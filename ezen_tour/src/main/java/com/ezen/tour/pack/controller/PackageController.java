package com.ezen.tour.pack.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/package")
public class PackageController {
	private static final Logger logger
		= LoggerFactory.getLogger(PackageController.class);
	
	@RequestMapping("/packageDetail.do")
	public String packageDetail() {
		logger.info("패키지 상세 보여주기");
		return "package/packageDetail";
	}
	
	@RequestMapping("/packageList.do")
	public String packageList() {
		logger.info("패키지 리스트 보여주기");
		return "package/packageList";
	}
	
	@RequestMapping("/packageListDetail.do")
	public String packageListDetail() {
		logger.info("패키지 항목별 리스트 보여주기");
		return "package/packageListDetail";
	}
}
