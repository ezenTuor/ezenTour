package com.ezen.tour.mamager.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.tour.common.FileUploadUtil;
import com.ezen.tour.manager.pack.model.ManagerPackService;
import com.ezen.tour.manager.pack.model.ManagerPackVo;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	private Logger logger=LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@Autowired
	private ManagerPackService managerPackService;
	
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
	public String packWrite_post(@ModelAttribute ManagerPackVo packVo, HttpServletRequest request) {
		logger.info("패키지 상품 작성 처리, 파라미터 packVo={}", packVo);
		
		//파일 업로드 처리
		String paramName="packImages";
		
		List<Map<String, Object>> list=fileUtil.fileUpload(request, FileUploadUtil.IMAGE_UPLOAD, paramName);
		
		//아직 테스트중
		String fileNames="", fileSizes="";
		for(int i=0; i<list.size(); i++) {
			Map<String, Object> filemap=list.get(i);
			String ofilename=(String)filemap.get("originalFileName");
			String filename=(String)filemap.get("fileName");
			long filesize=(Long)filemap.get("fileSize");
			
			System.out.println("ofn="+ofilename+", fn="+filename+", size="+filesize);
			
			//첫번째 파일이 아닐때 구분자 넣기
			if(fileNames!=null && !fileNames.isEmpty()) {
				fileNames+="|";
				fileSizes+="|";
			}
			fileNames+=filename;
			fileSizes+=filesize;
		}
		logger.info("파일 묶음 처리, fileNames={}, fileSizes={}", fileNames, fileSizes);
		packVo.setImgNames(fileNames);
		packVo.setImgSizes(fileSizes);
		
		logger.info("처리후 packVo={}", packVo);
		
		int cnt=managerPackService.insertPack(packVo);
		logger.info("pack 입력 처리 cnt={}", cnt);
		
		return null;
	}
}
