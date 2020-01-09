package com.ezen.tour.mamager.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	private Logger logger=LoggerFactory.getLogger(ManagerController.class);
	
	@RequestMapping("/managerMain.do")
	public String adminMain() {
		logger.info("관리자 메인 화면 보여주기");
		return "manager/managerMain";
	}
	
	@RequestMapping(value="/pack/packWrite.do", method=RequestMethod.GET)
	public void packWrite_get() {
		logger.info("패키지 상품 작성 화면 보여주기");
	}
	
	@RequestMapping(value="/pack/packWrite.do", method=RequestMethod.POST)
	public String packWrite_post(HttpServletRequest request) {
		//파일 업로드 처리
		MultipartHttpServletRequest multiReq=(MultipartHttpServletRequest)request;
		
		List<MultipartFile> olist=multiReq.getFiles("packImages");
		System.out.println(olist.size());
		//결과를 넣을 List
		List<Map<String, Object>> list=new ArrayList<Map<String,Object>>();
		
		
		//아직 테스트중!!!
		//
		//
		//
		//
		for(int i=0; i<olist.size(); i++) {
			MultipartFile file=olist.get(i);
			System.out.println(file);
			System.out.println(file.getOriginalFilename());
			System.out.println(file.getName());
			System.out.println(file.getSize());
		}
		return null;
	}
}
