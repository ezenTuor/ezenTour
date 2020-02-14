package com.ezen.tour.manager.controller;

import java.io.Writer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.tour.common.PaginationInfo;
import com.ezen.tour.common.Utility;
import com.ezen.tour.manager.pack.model.ManagerPackService;
import com.ezen.tour.manager.pack.model.ManagerPackViewVO;
import com.ezen.tour.manager.pack.model.ManagerPackVo;
import com.ezen.tour.manager.packDetail.model.ManagerDetailService;
import com.ezen.tour.manager.packDetail.model.ManagerDetailVO;
import com.ezen.tour.manager.packDetail.model.ManagerDetailViewVO;

@Controller
@RequestMapping("/manager/detail")
public class ManagerPackDetailController {
	private Logger logger=LoggerFactory.getLogger(ManagerPackDetailController.class);
	
	@Autowired
	private ManagerDetailService managerDetailService;
	
	@Autowired
	private ManagerPackService managerPackService;
	
	@RequestMapping(value="/detailWrite.do", method=RequestMethod.GET)
	public void packDetail(@RequestParam int packNo) {
		logger.info("패키지 상세 작성화면 보여주기, 파라미터 packNo={}", packNo);
	}
	
	@RequestMapping(value="/detailWrite.do", method=RequestMethod.POST)
	public String packDetailWrite(@ModelAttribute ManagerDetailVO detailVo) {
		//현재 int 부분에 null이 들어오면 오류가 나는중
		logger.info("패키지 상세 작성처리 detailVo={}", detailVo);
		
		//day_detail 처리
		String start=detailVo.getKoreaDep();
		String end=detailVo.getKoreaEnt();
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy/MM/dd [hh:mm]");
		int day=0;
		try {
			Date sday=sdf.parse(start);
			Date eday=sdf.parse(end);
			
			long gap=eday.getTime()-sday.getTime();
			gap=gap/(1000*60*60*24);
			day=(int)Math.ceil(gap);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		detailVo.setDaysDetail(day+"일");
		//
		
		//예약가능 인원수 처리
		detailVo.setCapecityCur(detailVo.getCapecity());
		logger.info("처리 후 패키지 디테일, detailVo={}",detailVo);
		
		int cnt=managerDetailService.insertDetail(detailVo);
		logger.info("패키지 상제 작성 처리 결과 cnt={}",cnt);
		
		return "redirect:/manager/schedule/scheduleWrite.do?packDno="+detailVo.getPackDno();
	}
	
	@RequestMapping("/detailList.do")
	public void detailList(@RequestParam int packNo, Model model) {
		logger.info("패키지 소분류 목록 보여주기, 파라미터 packNo={}", packNo);
		
		ManagerPackVo packVo=managerPackService.selectPack(packNo);
		
		List<ManagerDetailVO> list=managerDetailService.selectDetailsByPackNo(packNo);
		
		logger.info("패키지 소분류 조회 결과 packVo={}, list.size={}", packVo, list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("packVo", packVo);
	}
	
	@RequestMapping(value="/detailEdit.do", method = RequestMethod.GET)
	public void detailEdit(@RequestParam int packDno, Model model) {
		logger.info("패키지 소분류 수정화면, 파라미터 packDno={}", packDno);
		
		ManagerDetailVO detailVo=managerDetailService.selectDetail(packDno);
		
		logger.info("패키시 소분류 조회 결고, detailVo={}", detailVo);
		
		model.addAttribute("detailVo", detailVo);
	}
	
	@RequestMapping(value="/detailEdit.do", method=RequestMethod.POST)
	public String detailList(@ModelAttribute ManagerDetailVO detailVo) {
		logger.info("패키지 소분류 목록 보여주기, 파라미터 detailVo={}", detailVo);
		
		int cnt=managerDetailService.insertDetail(detailVo);
		logger.info("입력 처리 결과 cnt={}", cnt);
		
		return "redirect:/manager/detail/detail.do?packDno="+detailVo.getPackDno();
	}
	
	@RequestMapping(value="/detail.do")
	public void detailShow(@RequestParam int packDno, Model model) {
		logger.info("패키지 소분류 디테일화면, 파라미터 packDno={}", packDno);
		
		ManagerDetailViewVO detailViewVo=managerDetailService.selectDetailView(packDno);
		
		logger.info("패키시 소분류 뷰 조회 결과, detailViewVo={}", detailViewVo);
		
		model.addAttribute("detailViewVo", detailViewVo);
	}
}
