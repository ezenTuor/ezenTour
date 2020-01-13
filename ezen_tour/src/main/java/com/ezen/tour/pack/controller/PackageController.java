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

@Controller
@RequestMapping("/package")
public class PackageController {
	private static final Logger logger
		= LoggerFactory.getLogger(PackageController.class);
	
	@Autowired
	private PackDetailService packDetailService;
	
	@RequestMapping("/packageDetail.do")
	public String packageDetail(@RequestParam(defaultValue = "0") int packNo, Model model) {
		logger.info("��Ű�� ���� �� ����");
		
		if(packNo==0) {
			logger.info("���� ������");
		}
		
		
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
}
