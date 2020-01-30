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
		logger.info("패키지 상품 작성 화면 보여주기");
		
		List<CountryVO> list=countryService.selectAll();
		List<ManagerAreaVO> list2=areaService.selectArea();
		
		model.addAttribute("countryList", list);
		model.addAttribute("areaList", list2);
	}
	
	@RequestMapping(value="/packWrite.do", method=RequestMethod.POST)
	public String packWrite_post(@ModelAttribute ManagerPackVo packVo, HttpServletRequest request) {
		logger.info("패키지 상품 작성 처리, 파라미터 packVo={}", packVo);
		
		//파일 업로드 처리
		String paramName="packImages";
		
		List<Map<String, Object>> list=fileUtil.fileUpload(request, FileUploadUtil.PD_UPLOAD, paramName);
		
		//파일이름, 파일사이즈 묶기
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
		
		logger.info("처리후 packVo={}", packVo);
		
		int cnt=managerPackService.insertPack(packVo);
		logger.info("pack 입력 처리 cnt={}", cnt);
		
		//패키지 대분류 넘버
		//model.addAttribute("packVo", packVo);
		//model.addAttribute("pack_no", packVo.getPackNo());
		
		return "redirect:/manager/pack/detailWrite.do?packNo="+packVo.getPackNo();
	}
	
	@RequestMapping(value="/detailWrite.do", method=RequestMethod.GET)
	public void packDetail(@RequestParam int packNo) {
		logger.info("디테일 작성 화면 보여주기, 파라미터 packNo={}", packNo);
	}
	
	@RequestMapping(value="/detailWrite.do", method=RequestMethod.POST)
	public String packDetailWrite(@ModelAttribute PackDetailVO detailVo) {
		logger.info("디테일 작성 처리, 파라미터 detailVo={}", detailVo);
		return null;
	}
	
	@RequestMapping("/packList.do")
	public void packList(Model model) {
		logger.info("관리자 상품 리스트 띄우기");
		
		List<ManagerPackVo> list=managerPackService.selectList();
		logger.info("관리자 상품(대분류) list.size={}",list.size());
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/packEdit.do", method=RequestMethod.GET)
	public void packEdit(@RequestParam int packNo, Model model) {
		logger.info("관리자 상품 수정 띄우기, 파라미터 packNo={}", packNo);
		
		ManagerPackVo packvo=managerPackService.selectPack(packNo);
		List<CountryVO> list=countryService.selectAll();
		List<ManagerAreaVO> list2=areaService.selectArea();
		
		//키워드 처리
		String str=packvo.getKeyword();
		String[] keyArr=str.split("\\|");
		//System.out.println(str);
		
		str=keyArr[0];
		for(int i=1; i<keyArr.length; i++) {
			str+=", "+keyArr[i];
			//System.out.println(keyArr[i]);
		}
		packvo.setKeyword(str);
		logger.info("띄우기 전 수정 후 packVo={}",packvo);
		
		model.addAttribute("countryList", list);
		model.addAttribute("areaList", list2);
		model.addAttribute("packVo", packvo);
	}
	
	@RequestMapping(value="/packEdit.do", method=RequestMethod.POST)
	public String packEdit(@ModelAttribute ManagerPackVo packVo, HttpServletRequest request, Model model) {
		logger.info("관리자 상품 수정 처리, 파라미터 packVo={}", packVo);
		
		String paramName="packImages";
		
		//여러 처리를 위한 기존 데이터 불러오기
		ManagerPackVo oldVo=managerPackService.selectPack(packVo.getPackNo());
		
		//업로드전 확인
		MultipartHttpServletRequest multiReq=(MultipartHttpServletRequest)request;
		List<MultipartFile> olist=multiReq.getFiles(paramName);
		
		//파일이 존재할때 처리(기본 파일이 없는 경우는 없다.)
		if(olist.get(0).getSize()!=0) {
			logger.info("패키지 수정 - 파일이 존재 함");
			//기본 파일 삭제
			String oldImages=oldVo.getImgNames();
			String[] oldImgArr=oldImages.split("\\|");
			
			String path=fileUtil.getFilePath(request, FileUploadUtil.PD_UPLOAD);
			
			for(String oldnames : oldImgArr) {
				File oldFile=new File(path, oldnames);
				if(oldFile.exists()) {
					oldFile.delete();
				}
			}
			
			//새파일 업로드
			List<Map<String, Object>> list=fileUtil.fileUpload(request, FileUploadUtil.PD_UPLOAD, paramName);
			
			//파일이름, 파일사이즈 묶기
			String fileNames="", fileSizes="";
			for(int i=0; i<list.size(); i++) {
				Map<String, Object> filemap=list.get(i);
				String ofilename=(String)filemap.get("originalFileName");
				String filename=(String)filemap.get("fileName");
				long filesize=(Long)filemap.get("fileSize");
				
				//System.out.println("ofn="+ofilename+", fn="+filename+", size="+filesize);
				
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
		}else{//새로운 파일이 존재하지 않을 때 처리
			logger.info("패키지 수정 - 파일이 없음");
			packVo.setImgNames(oldVo.getImgNames());
			packVo.setImgSizes(oldVo.getImgSizes());
		}
		
		
		//키워드 처리
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
		
		logger.info("처리후 packVo={}", packVo);
		
		int cnt=managerPackService.updatePack(packVo);
		logger.info("pack 입력 처리 cnt={}", cnt);
		
		String msg="", url="";
		if(cnt>0) {
			msg="수정되었습니다.";
			url="/manager/pack/packList.do";
		}else {
			msg="실패하였습니다.";
			url="/manager/pack/packList.do";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
