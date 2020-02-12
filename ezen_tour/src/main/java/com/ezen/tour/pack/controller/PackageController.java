package com.ezen.tour.pack.controller;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.border.EmptyBorder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.tour.manager.schedule.ManagerScheduleVO;
import com.ezen.tour.pack.model.AreaDetailVO;
import com.ezen.tour.pack.model.AreaVO;
import com.ezen.tour.pack.model.MaxMinPriceVO;
import com.ezen.tour.pack.model.PackDetailService;
import com.ezen.tour.pack.model.PackDetailVO;
import com.ezen.tour.pack.model.PackTwoVO;
import com.ezen.tour.pack.model.PackVO;
import com.ezen.tour.wishList.model.WishListVO;

@Controller
@RequestMapping("/package")
public class PackageController {
	private static final Logger logger
		= LoggerFactory.getLogger(PackageController.class);
	
	@Autowired
	private PackDetailService packDetailService;
	
	@RequestMapping(value="/packageDetail.do", method=RequestMethod.GET)
	public String packageDetail_get(@RequestParam(defaultValue = "0") int packDno, Model model, HttpServletRequest request) {
		logger.info("packDetail, packDno={}", packDno);
		
		if(packDno==0) {
			logger.info("when packDno it 0");
		}
		
		PackDetailVO packDetailVo = packDetailService.selectPackDetail(packDno);
		logger.info("packDetail, vo={}", packDetailVo);
		
		int packNumber = packDetailVo.getPackNo();
		
		PackVO packVo = packDetailService.selectPack(packNumber);
		
		HttpSession session = request.getSession();
		String userNo = (String) session.getAttribute("");
		
		Integer avg = packDetailService.scoreAvg(packDno);
		logger.info("avg num={}", avg);
		double avgScore = 0;
		if(avg != null) {
			avgScore = Math.round(avg)*100/100.0;
		} 
		
		List<ManagerScheduleVO> sheduleVo = packDetailService.selectSch(packDno);
		String schDetail = "";
		for(int i=0; i<sheduleVo.size();i++) {
			schDetail += ("<div><div class='day-check'>"+(i+1)+"일차</div><div class='day-sch'>"+sheduleVo.get(i).getDetail()+"</div></div><br>");
		}
		
		model.addAttribute("packDetailVo", packDetailVo);
		model.addAttribute("packVo", packVo);
		model.addAttribute("userNo", userNo);
		model.addAttribute("avgScore", avgScore);
		model.addAttribute("schDetail", schDetail);
		return "package/packageDetail";
	}
	
	
	@RequestMapping(value="/packageDetail.do", method=RequestMethod.POST)
	public String packDetail_post(@ModelAttribute WishListVO wishListVo, HttpServletRequest request, Model model) {
		logger.info("카트로 넘기기 vo={}", wishListVo);
		int cnt = packDetailService.insertWish(wishListVo);
		int outNum = wishListVo.getBaby()+wishListVo.getChild()+wishListVo.getMan();
		int packDnoNo=wishListVo.getPackDno();
		PackDetailVO detailVo = packDetailService.selectPackDetail(packDnoNo);
		int lastTimeLeft = detailVo.getCapecityCur(); //이전 남은 인원
		
		int nowLeft = lastTimeLeft-outNum; //남은 인원
		
		PackDetailVO packDetailVo = new PackDetailVO();//update에 쓸vo
		packDetailVo.setCapecityCur(nowLeft);
		packDetailVo.setPackDno(packDnoNo);
		
		if(cnt>0) {
			int updateCnt = packDetailService.updateCapaCur(packDetailVo);
			logger.info("카트 등록 성공");
			if(updateCnt>0) {
				logger.info("업데이트 성공");
			} else {
				logger.info("업데이트 실패");
			}
			
		} else {
			logger.info("카트 등록 실패");
		}
		
		return "package/packageDetail";
	}
	
	
	@RequestMapping("/packageList.do")
	public String packageList(Model model) {
		logger.info("This is packageList");
		
		List<AreaVO> areaList = packDetailService.areaSelect();
		logger.info("areaList.size={}", areaList.size());
		
		model.addAttribute("areaList", areaList);
		
		return "package/packageList";
	}
	
	
	@RequestMapping("/packageListDetail.do")
	public String packageListDetail(@RequestParam(defaultValue = "1") int areaNo, Model model) {
		logger.info("This is packageListDetail, areaNo={}", areaNo);
		
		List<AreaDetailVO> areaDetailList = packDetailService.selectAreaDetail(areaNo);
		logger.info("areaDetailList={}", areaDetailList);
		
		model.addAttribute("areaDetailList", areaDetailList);
		return "package/packageListDetail";
	}
	
	
	@RequestMapping("/packSelectSchedule.do")
	public String packageSelectSchedule(@RequestParam(defaultValue="0") int packNo, Model model) {
		logger.info("this is pack SelectSchedule, packNo={}", packNo);
		
		if(packNo==0) {
			logger.info("when packNo is 0");
		}
		
		PackVO packVo = packDetailService.selectPack(packNo);
		MaxMinPriceVO maxMin = packDetailService.selectMinMaxPrice(packNo);
		logger.info("when minPrice is={}", maxMin);
		
		List<String> dateList = packDetailService.selDate(packNo);
		List<String> cutDate = new ArrayList<String>();
		for(int i=0; i<dateList.size(); i++) {
			String date = dateList.get(i).substring(0, 10);
			cutDate.add(date);	
		}
		logger.info("all Lists={}",cutDate);
		
		model.addAttribute("packVo", packVo);
		model.addAttribute("maxMin",maxMin);
		model.addAttribute("cutDate", cutDate);
		
		return "package/packSelectSchedule";
	}
	
	/*
	@RequestMapping("/packDetailListSelect.do")
	public String packDetailListSelect(@RequestParam(defaultValue = "1") int tagNo, Model model) {
		logger.info("This is packDetailListSelect, tagNo={}", tagNo);
		
		//List<String> areaKwList = packDetailService.selKWList(tagNo);
		String keyword = packDetailService.areaKeyword(tagNo);
		//List<PackVO> packVo = packDetailService.selectPackByKw(keyword);
		List<PackTwoVO> packTwoVo = packDetailService.selectPackByKw2(keyword);

		logger.info("keyword={}",keyword);
		logger.info("packTwoVo={}",packTwoVo);
		//model.addAttribute("packVo", packVo);
		model.addAttribute("packTwoVo", packTwoVo);	
		
		return "package/packDetailListSelect";
	}
	*/

	
	@RequestMapping(value="/packCategory.do", method=RequestMethod.GET)
	public String packCategory_get(Model model) {
		
		return "package/packCategory";
	}
	
	@RequestMapping(value="/packCategory.do", method=RequestMethod.POST)
	public String packCategory_post(@ModelAttribute PackTwoVO packTwoVo, HttpServletRequest request, Model model) {
		
		List<PackTwoVO>packList =  packDetailService.selectPackByKw2(packTwoVo.getKeyword());
		model.addAttribute("packList", packList);
		logger.info("got packList={}", packList);
		return "package/packDetailListSelect";
	}
	
}
