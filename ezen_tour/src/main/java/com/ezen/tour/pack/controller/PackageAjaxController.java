package com.ezen.tour.pack.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.tour.pack.model.PackDetailService;
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
		logger.info("�������� ȭ�� �ӽ�={}", areaNo);
		
		List<PackVO> packMenu = packDetailService.packSelAreaNo(areaNo);
		logger.info("����Ʈ ����={}", packMenu.size());
		
		return packMenu;
	}
	
	
}
