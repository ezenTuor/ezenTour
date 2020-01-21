package com.ezen.tour.manager.controller;

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
public class ManagerController{
	private Logger logger=LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@Autowired
	private ManagerPackService managerPackService;
	
	@RequestMapping("/managerMain.do")
	public String adminMain() {
		logger.info("������ ���� ȭ�� �����ֱ�");
		return "manager/managerMain";
	}
	
	@RequestMapping(value="/pack/packWrite.do", method=RequestMethod.GET)
	public void packWrite_get() {
		logger.info("��Ű�� ��ǰ �ۼ� ȭ�� �����ֱ�");
	}
	
	@RequestMapping(value="/pack/packWrite.do", method=RequestMethod.POST)
	public String packWrite_post(@ModelAttribute ManagerPackVo packVo, HttpServletRequest request) {
		logger.info("��Ű�� ��ǰ �ۼ� ó��, �Ķ���� packVo={}", packVo);
		
		//���� ���ε� ó��
		String paramName="packImages";
		
		List<Map<String, Object>> list=fileUtil.fileUpload(request, FileUploadUtil.PD_UPLOAD, paramName);
		
		//���� �׽�Ʈ��
		String fileNames="", fileSizes="";
		for(int i=0; i<list.size(); i++) {
			Map<String, Object> filemap=list.get(i);
			String ofilename=(String)filemap.get("originalFileName");
			String filename=(String)filemap.get("fileName");
			long filesize=(Long)filemap.get("fileSize");
			
			System.out.println("ofn="+ofilename+", fn="+filename+", size="+filesize);
			
			//ù��° ������ �ƴҶ� ������ �ֱ�
			if(fileNames!=null && !fileNames.isEmpty()) {
				fileNames+="|";
				fileSizes+="|";
			}
			fileNames+=filename;
			fileSizes+=filesize;
		}
		logger.info("���� ���� ó��, fileNames={}, fileSizes={}", fileNames, fileSizes);
		packVo.setImgNames(fileNames);
		packVo.setImgSizes(fileSizes);
		
		logger.info("ó���� packVo={}", packVo);
		
		int cnt=managerPackService.insertPack(packVo);
		logger.info("pack �Է� ó�� cnt={}", cnt);
		
		return "redirect:/manager/pack/detailWrite.do";
	}
	
	@RequestMapping(value="/pack/detailWrite.do", method=RequestMethod.GET)
	public void detailWrite_get() {
		logger.info("��Ű�� �� �ۼ� ȭ�� ó��");
	}
}
