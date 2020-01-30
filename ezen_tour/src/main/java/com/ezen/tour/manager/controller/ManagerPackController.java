package com.ezen.tour.manager.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ezen.tour.common.FileUploadUtil;
import com.ezen.tour.country.model.CountryService;
import com.ezen.tour.country.model.CountryVO;
import com.ezen.tour.manager.area.model.AreaService;
import com.ezen.tour.manager.area.model.ManagerAreaVO;
import com.ezen.tour.manager.pack.model.ManagerPackService;
import com.ezen.tour.manager.pack.model.ManagerPackVo;
import com.ezen.tour.pack.model.PackDetailVO;

@Controller
@RequestMapping("/manager/pack")
public class ManagerPackController {
	private Logger logger=LoggerFactory.getLogger(ManagerPackController.class);
	
	@Autowired
	private ManagerPackService managerPackService;
	@Autowired
	private CountryService countryService;
	@Autowired
	private AreaService areaService;
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping(value="/packWrite.do", method=RequestMethod.GET)
	public void packWrite_get(Model model) {
		logger.info("��Ű�� ��ǰ �ۼ� ȭ�� �����ֱ�");
		
		List<CountryVO> list=countryService.selectAll();
		List<ManagerAreaVO> list2=areaService.selectArea();
		
		model.addAttribute("countryList", list);
		model.addAttribute("areaList", list2);
	}
	
	@RequestMapping(value="/packWrite.do", method=RequestMethod.POST)
	public String packWrite_post(@ModelAttribute ManagerPackVo packVo, HttpServletRequest request) {
		logger.info("��Ű�� ��ǰ �ۼ� ó��, �Ķ���� packVo={}", packVo);
		
		//���� ���ε� ó��
		String paramName="packImages";
		
		List<Map<String, Object>> list=fileUtil.fileUpload(request, FileUploadUtil.PD_UPLOAD, paramName);
		
		//�����̸�, ���ϻ����� ����
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
		
		
		String keyword=packVo.getKeyword();
		String keyArr[]=keyword.split(",");
		for(int i=0;i<keyArr.length;i++) {
			if(i==0) {
				keyword=keyArr[i];
			}else {
				keyword+="|"+keyArr[i].trim();
			}
		}
		packVo.setKeyword(keyword);
		
		logger.info("ó���� packVo={}", packVo);
		
		int cnt=managerPackService.insertPack(packVo);
		logger.info("pack �Է� ó�� cnt={}", cnt);
		
		//��Ű�� ��з� �ѹ�
		//model.addAttribute("packVo", packVo);
		//model.addAttribute("pack_no", packVo.getPackNo());
		
		return "redirect:/manager/pack/detailWrite.do?packNo="+packVo.getPackNo();
	}
	
	@RequestMapping(value="/detailWrite.do", method=RequestMethod.GET)
	public void packDetail(@RequestParam int packNo) {
		logger.info("������ �ۼ� ȭ�� �����ֱ�, �Ķ���� packNo={}", packNo);
	}
	
	@RequestMapping(value="/detailWrite.do", method=RequestMethod.POST)
	public String packDetailWrite(@ModelAttribute PackDetailVO detailVo) {
		logger.info("������ �ۼ� ó��, �Ķ���� detailVo={}", detailVo);
		return null;
	}
	
	@RequestMapping("/packList.do")
	public void packList(Model model) {
		logger.info("������ ��ǰ ����Ʈ ����");
		
		List<ManagerPackVo> list=managerPackService.selectList();
		logger.info("������ ��ǰ(��з�) list.size={}",list.size());
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/packEdit.do", method=RequestMethod.GET)
	public void packEdit(@RequestParam int packNo, Model model) {
		logger.info("������ ��ǰ ���� ����, �Ķ���� packNo={}", packNo);
		
		ManagerPackVo packvo=managerPackService.selectPack(packNo);
		List<CountryVO> list=countryService.selectAll();
		List<ManagerAreaVO> list2=areaService.selectArea();
		
		//Ű���� ó��
		String str=packvo.getKeyword();
		String[] keyArr=str.split("\\|");
		//System.out.println(str);
		
		str=keyArr[0];
		for(int i=1; i<keyArr.length; i++) {
			str+=", "+keyArr[i];
			//System.out.println(keyArr[i]);
		}
		packvo.setKeyword(str);
		logger.info("���� �� ���� �� packVo={}",packvo);
		
		model.addAttribute("countryList", list);
		model.addAttribute("areaList", list2);
		model.addAttribute("packVo", packvo);
	}
	
	@RequestMapping(value="/packEdit.do", method=RequestMethod.POST)
	public String packEdit(@ModelAttribute ManagerPackVo packVo, HttpServletRequest request, Model model) {
		logger.info("������ ��ǰ ���� ó��, �Ķ���� packVo={}", packVo);
		
		String paramName="packImages";
		
		//���� ó���� ���� ���� ������ �ҷ�����
		ManagerPackVo oldVo=managerPackService.selectPack(packVo.getPackNo());
		
		//���ε��� Ȯ��
		MultipartHttpServletRequest multiReq=(MultipartHttpServletRequest)request;
		List<MultipartFile> olist=multiReq.getFiles(paramName);
		
		//������ �����Ҷ� ó��(�⺻ ������ ���� ���� ����.)
		if(olist.get(0).getSize()!=0) {
			logger.info("��Ű�� ���� - ������ ���� ��");
			//�⺻ ���� ����
			String oldImages=oldVo.getImgNames();
			String[] oldImgArr=oldImages.split("\\|");
			
			String path=fileUtil.getFilePath(request, FileUploadUtil.PD_UPLOAD);
			
			for(String oldnames : oldImgArr) {
				File oldFile=new File(path, oldnames);
				if(oldFile.exists()) {
					oldFile.delete();
				}
			}
			
			//������ ���ε�
			List<Map<String, Object>> list=fileUtil.fileUpload(request, FileUploadUtil.PD_UPLOAD, paramName);
			
			//�����̸�, ���ϻ����� ����
			String fileNames="", fileSizes="";
			for(int i=0; i<list.size(); i++) {
				Map<String, Object> filemap=list.get(i);
				String ofilename=(String)filemap.get("originalFileName");
				String filename=(String)filemap.get("fileName");
				long filesize=(Long)filemap.get("fileSize");
				
				//System.out.println("ofn="+ofilename+", fn="+filename+", size="+filesize);
				
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
		}else{//���ο� ������ �������� ���� �� ó��
			logger.info("��Ű�� ���� - ������ ����");
			packVo.setImgNames(oldVo.getImgNames());
			packVo.setImgSizes(oldVo.getImgSizes());
		}
		
		
		//Ű���� ó��
		String keyword=packVo.getKeyword();
		String keyArr[]=keyword.split(",");
		for(int i=0;i<keyArr.length;i++) {
			if(i==0) {
				keyword=keyArr[i];
			}else {
				keyword+="|"+keyArr[i].trim();
			}
		}
		packVo.setKeyword(keyword);
		
		logger.info("ó���� packVo={}", packVo);
		
		int cnt=managerPackService.updatePack(packVo);
		logger.info("pack �Է� ó�� cnt={}", cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="�����Ǿ����ϴ�.";
			url="/manager/pack/packList.do";
		}else {
			msg="�����Ͽ����ϴ�.";
			url="/manager/pack/packList.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
