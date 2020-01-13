package com.ezen.tour.pack.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.tour.pack.model.PackDetailService;
import com.ezen.tour.pack.model.PackDetailVO;
import com.ezen.tour.pack.model.PackVO;

@Controller
@RequestMapping("/package")
public class PackageController {
	private static final Logger logger
		= LoggerFactory.getLogger(PackageController.class);
	
	@Autowired
	private PackDetailService packDetailService;
	
	@RequestMapping("/packageDetail.do")
	public String packageDetail(@RequestParam(defaultValue = "0") int packDno, Model model) {
		logger.info("패키지 개별 상세 정보");
		
		if(packDno==0) {
			logger.info("없는 페이지");
		}
		
		PackDetailVO packDetailVo = packDetailService.selectPackDetail(packDno);
		
		
		return "package/packageDetail";
	}
	
	@RequestMapping("/packageList.do")
	public String packageList() {
		logger.info("패키지 리스트");
		return "package/packageList";
	}
	
	@RequestMapping("/packageListDetail.do")
	public String packageListDetail() {
		logger.info("패키지 리스트 상세 정보");
		return "package/packageListDetail";
	}
}
