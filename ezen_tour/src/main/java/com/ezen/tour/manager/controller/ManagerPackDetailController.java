package com.ezen.tour.manager.controller;

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

import com.ezen.tour.manager.packDetail.model.ManagerDetailService;
import com.ezen.tour.manager.packDetail.model.ManagerDetailVO;

@Controller
@RequestMapping("/manager/detail")
public class ManagerPackDetailController {
	private Logger logger=LoggerFactory.getLogger(ManagerPackDetailController.class);
	
	@Autowired
	private ManagerDetailService managerDetailService;
	
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
		
		int cnt=managerDetailService.insertDetail(detailVo);
		logger.info("패키지 상제 작성 처리 결과 cnt={}",cnt);
		logger.info("처리 후 패키지 디테일, detailVo={}",detailVo);
		
		return "redirect:/manager/schedule/scheduleWrite.do?detailNo="+detailVo.getPackDno();
	}
	
	@RequestMapping("/detailList.do")
	public void detailList(@RequestParam int packNo, Model model) {
		logger.info("패키지 소분류 목록 보여주기, 파라미터 packNo={}", packNo);
		
		List<ManagerDetailVO> list=managerDetailService.selectDetailsByPackNo(packNo);
		
		logger.info("패키지 소분류 조회 결과 list.size={}",list.size());
		
		model.addAttribute("list", list);
	}
	
}
