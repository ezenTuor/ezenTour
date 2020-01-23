package com.ezen.tour.manager.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.tour.common.FileUploadUtil;
import com.ezen.tour.country.model.CountryService;
import com.ezen.tour.country.model.CountryVO;
import com.ezen.tour.manager.area.model.AreaService;
import com.ezen.tour.manager.area.model.ManagerAreaVO;
import com.ezen.tour.manager.areadetail.model.AreaDetailService;
import com.ezen.tour.manager.areadetail.model.ManagerAreaDetailVO;
import com.ezen.tour.manager.pack.model.ManagerPackService;
import com.ezen.tour.manager.pack.model.ManagerPackVo;
import com.ezen.tour.pack.model.PackDetailVO;

@Controller
@RequestMapping("/manager")
public class ManagerController{
	private Logger logger=LoggerFactory.getLogger(ManagerController.class);
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@Autowired
	private ManagerPackService managerPackService;
	
	@Autowired
	private CountryService countryService;
	
	@Autowired
	private AreaService areaService;
	
	@Autowired
	private AreaDetailService areaDetailService;
	
	@RequestMapping("/managerMain.do")
	public String adminMain() {
		logger.info("������ ���� ȭ�� �����ֱ�");
		return "manager/managerMain";
	}
	
	@RequestMapping(value="/pack/packWrite.do", method=RequestMethod.GET)
	public void packWrite_get(Model model) {
		logger.info("��Ű�� ��ǰ �ۼ� ȭ�� �����ֱ�");
		
		List<CountryVO> list=countryService.selectAll();
		List<ManagerAreaVO> list2=areaService.selectArea();
		
		model.addAttribute("countryList", list);
		model.addAttribute("areaList", list2);
	}
	
	@RequestMapping("/area.do")
	@ResponseBody
	public List<ManagerAreaDetailVO> area(@RequestParam int no){
		logger.info("area ������ ó��, �Ķ���� no={}",no);
		//[{"tagNo":1,"areaNo":1,"name":"������","keyword":"������|����|������|���¸�"},...
		return areaDetailService.selectAreaDetail(no);
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
	
	@RequestMapping(value="/pack/detailWrite.do", method=RequestMethod.GET)
	public void packDetail(@RequestParam int packNo) {
		logger.info("������ �ۼ� ȭ�� �����ֱ�, �Ķ���� packNo={}", packNo);
	}
	
	@RequestMapping(value="/pack/detailWrite.do", method=RequestMethod.POST)
	public String packDetailWrite(@ModelAttribute PackDetailVO detailVo) {
		logger.info("������ �ۼ� ó��, �Ķ���� detailVo={}", detailVo);
		return null;
	}
	
	@RequestMapping("/test.do")
	public String test() {
		logger.info("�׽�Ʈ");
		return "manager/test";
	}
}
