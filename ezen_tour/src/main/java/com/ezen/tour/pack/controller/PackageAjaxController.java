package com.ezen.tour.pack.controller;

import java.sql.Timestamp;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.tour.pack.model.PackDetailService;
import com.ezen.tour.pack.model.PackDetailVO;
import com.ezen.tour.pack.model.PackVO;

@Controller
@RequestMapping()
public class PackageAjaxController {
	private static final Logger logger
		= LoggerFactory.getLogger(PackageAjaxController.class);
	
	@Autowired
	private PackDetailService packDetailService;
	
	@RequestMapping("/areaPack.do")
	@ResponseBody
	public List<PackVO> areaPack(@RequestParam int areaNo){
		logger.info("에이젝스 화면 임시={}", areaNo);
		
		List<PackVO> packMenu = packDetailService.packSelAreaNo(areaNo);
		logger.info("리스트 길이={}", packMenu.size());
		
		return packMenu;
	}
	
	@RequestMapping("/dateSelect.do")
	@ResponseBody
	public List<PackDetailVO> packDateSelect(@RequestParam String koreaDep){
		logger.info("에이젝스 화면 임시={}", koreaDep);
		List<PackDetailVO> packDetailList = packDetailService.selectByDate(koreaDep);
		logger.info("selectedByDate.size()={}", packDetailList.size());
		
		return packDetailList;
	}
	
}
