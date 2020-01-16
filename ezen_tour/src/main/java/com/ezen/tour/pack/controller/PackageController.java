package com.ezen.tour.pack.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.tour.pack.model.AreaVO;
import com.ezen.tour.pack.model.MaxMinPriceVO;
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
	public String packageDetail(@RequestParam(defaultValue = "1") int packDno, Model model) {
		logger.info("패키지 디테일 페이지, packDno={}", packDno);
		
		if(packDno==0) {
			logger.info("when packDno it 0");
		}
		
		PackDetailVO packDetailVo = packDetailService.selectPackDetail(packDno);
		logger.info("패키지 디테일 넘버, vo={}", packDetailVo);
		
		int packNumber = packDetailVo.getPackNo();
		
		PackVO packVo = packDetailService.selectPack(packNumber);
		
		model.addAttribute("packDetailVo", packDetailVo);
		model.addAttribute("packVo", packVo);
		return "package/packageDetail";
	}
	
	@RequestMapping("/packageList.do")
	public String packageList(Model model) {
		logger.info("This is packageList");
		
		List<AreaVO> areaList = packDetailService.areaSelect();
		logger.info("areaList.size={}", areaList.size());
		
		model.addAttribute("areaList", areaList);
		
		return "package/packageList";
	}
	
	@RequestMapping("/packageListDetail.do")
	public String packageListDetail() {
		logger.info("This is packageListDetail");
		return "package/packageListDetail";
	}
	
	@RequestMapping("/packSelectSchedule.do")
	public String packageSelectSchedule(@RequestParam(defaultValue="1") int packNo, Model model) {
		logger.info("this is pack SelectSchedule, packNo={}", packNo);
		
		if(packNo==0) {
			logger.info("when packNo is 0");
		}
		
		PackVO packVo = packDetailService.selectPack(packNo);
		MaxMinPriceVO maxMin = packDetailService.selectMinMaxPrice(packNo);
		logger.info("when minPrice is={}", maxMin);
		
		model.addAttribute("packVo", packVo);
		model.addAttribute("maxMin",maxMin);
		
		return "package/packSelectSchedule";
	}
}
