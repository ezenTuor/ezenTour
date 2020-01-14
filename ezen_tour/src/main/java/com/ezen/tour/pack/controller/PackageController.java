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
	public String packageDetail(@RequestParam(defaultValue = "1") int packDno, Model model) {
		logger.info("��Ű�� ���� �� ����, packDno={}", packDno);
		
		if(packDno==0) {
			logger.info("���� ������");
		}
		
		PackDetailVO packDetailVo = packDetailService.selectPackDetail(packDno);
		logger.info("�󼼺��� ���, vo={}", packDetailVo);
		
		int packNumber = packDetailVo.getPackNo();
		
		PackVO packVo = packDetailService.selectPack(packNumber);
		
		model.addAttribute("packDetailVo", packDetailVo);
		model.addAttribute("packVo", packVo);
		return "package/packageDetail";
	}
	
	@RequestMapping("/packageList.do")
	public String packageList() {
		logger.info("��Ű�� ����Ʈ");
		return "package/packageList";
	}
	
	@RequestMapping("/packageListDetail.do")
	public String packageListDetail() {
		logger.info("��Ű�� ����Ʈ �� ����");
		return "package/packageListDetail";
	}
	
	@RequestMapping("/packSelectSchedule.do")
	public String packageSelectSchedule() {
		logger.info("��Ű�� ����Ʈ �� ����");
		return "package/packSelectSchedule";
	}
}
