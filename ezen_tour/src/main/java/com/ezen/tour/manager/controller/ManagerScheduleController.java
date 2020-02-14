package com.ezen.tour.manager.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.tour.manager.packDetail.model.ManagerDetailService;
import com.ezen.tour.manager.packDetail.model.ManagerDetailVO;
import com.ezen.tour.manager.schedule.ManagerScheduleService;
import com.ezen.tour.manager.schedule.ManagerScheduleVO;

@Controller
@RequestMapping("/manager/schedule")
public class ManagerScheduleController {
	private Logger logger=LoggerFactory.getLogger(ManagerScheduleController.class);
	
	@Autowired
	private ManagerDetailService managerDetailService;
	
	@Autowired
	private ManagerScheduleService managerScheduleService;
	
	@SuppressWarnings("deprecation")
	@RequestMapping(value="/scheduleWrite.do", method=RequestMethod.GET)
	public void scheduleWrite(@RequestParam int packDno, Model model) {
		logger.info("일정 입력화면 보이기, 파라미터 packDno={}",packDno);
		
		ManagerDetailVO detailVo=managerDetailService.selectDetail(packDno);
		String startStr=detailVo.getKoreaDep();
		String endStr=detailVo.getKoreaEnt();
		
		System.out.println("시작날짜"+startStr);
		System.out.println("끝날짜"+endStr);
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		SimpleDateFormat sdf2=new SimpleDateFormat("yyyy/MM/dd");
		List<String> list=new ArrayList<String>();
		
		try {
			Date sDay=sdf.parse(startStr);
			Date eDay=sdf.parse(endStr);
			
			sDay.setHours(0);
			sDay.setMinutes(0);
			
			eDay.setHours(0);
			eDay.setMinutes(0);
			
			long stime=sDay.getTime();
			long etime=eDay.getTime();
			
			int gap=(int)(etime-stime)/(1000*60*60*24);
			System.out.println("두 날짜사이 간격"+gap);
			for(int i=0; i<=gap; i++) {
				String temp=sdf2.format(sDay);
				list.add(temp);
				System.out.println("디버깅용 i="+i+", 날짜tmep="+temp);
				sDay.setTime(sDay.getTime()+(1000*60*60*24));
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		model.addAttribute("packDno", packDno);
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/scheduleWrite.do", method=RequestMethod.POST)
	public String scheduleWrite(HttpServletRequest req, ModelMap model) throws Exception{
		logger.info("일정 작성 처리");
		//일정값 전부 받아오기
		Map<String, String[]> map=req.getParameterMap();
		//Set<String> keys=map.keySet();
		//Iterator<String> iter=keys.iterator();
		
		//일정 정보를 받아서 저장해 둘 List
		List<ManagerScheduleVO> list=new ArrayList<ManagerScheduleVO>();
		
		//map - iterator로 처리?
		String[] detail=map.get("detail");
		String[] meal=map.get("meal");
		String[] day=map.get("day");
		String[] hotel=map.get("hotel");
		String[] packDno=map.get("packDno");
		
		int pack_Dno=Integer.parseInt(packDno[0]);
		
		for(int i=0; i<day.length; i++) {
			ManagerScheduleVO tempvo=new ManagerScheduleVO();
			tempvo.setPackDno(pack_Dno);
			tempvo.setDetail(detail[i]);
			tempvo.setMeal(meal[i]);
			tempvo.setDay(day[i]);
			tempvo.setHotel(hotel[i]);
			
			System.out.println(tempvo);
			list.add(tempvo);
		}
		int cnt= managerScheduleService.insertSchedule(list);
		
		String msg="", url="";
		if(cnt>0) {
			msg="일정 등록에 성공하였습니다.";
			url="/manager/managerMain.do";
		}else {
			msg="일정 등록 실패!";
			url="/manager/managerMain.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/scheduleEdit.do", method=RequestMethod.GET)
	public void scheduleEdit(@RequestParam int packDno, Model model) {
		logger.info("스케줄 편집 화면 보이기, 파라미터 packDno={}", packDno);
		
		List<ManagerScheduleVO> list=managerScheduleService.selectByPackDno(packDno);
		logger.info("스케줄 목록 list.size={}",list.size());
		
		model.addAttribute("list", list);
	}
	
	@RequestMapping(value="/scheduleEdit.do", method=RequestMethod.POST)
	public String scheduleEdit(HttpServletRequest req, ModelMap model) {
		logger.info("스케줄 편집 처리하기");
		Map<String, String[]> map=req.getParameterMap();
		
		//일정 정보를 받아서 저장해 둘 List
		List<ManagerScheduleVO> list=new ArrayList<ManagerScheduleVO>();
		
		//map - iterator로 처리?
		String[] scheduleNo=map.get("scheduleNo");
		String[] detail=map.get("detail");
		String[] meal=map.get("meal");
		String[] day=map.get("day");
		String[] hotel=map.get("hotel");
		String[] packDno=map.get("packDno");
		
		int pack_Dno=Integer.parseInt(packDno[0]);
		
		for(int i=0; i<day.length; i++) {
			ManagerScheduleVO tempvo=new ManagerScheduleVO();
			tempvo.setScheduleNo(Integer.parseInt(scheduleNo[i]));
			tempvo.setPackDno(pack_Dno);
			tempvo.setDetail(detail[i]);
			tempvo.setMeal(meal[i]);
			tempvo.setDay(day[i]);
			tempvo.setHotel(hotel[i]);
			
			System.out.println(tempvo);
			list.add(tempvo);
		}
		int cnt= managerScheduleService.updateSchedule(list);
		
		String msg="", url="";
		if(cnt>0) {
			msg="일정 변경에 성공하였습니다.";
			url="/manager/managerMain.do";
		}else {
			msg="일정 변경 실패!";
			url="/manager/managerMain.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/scheduleList.do")
	public String scheduleList(@RequestParam int packDno, Model model) {
		logger.info("일정 목록 보여주기, 파라미터 packDno={}", packDno);
		
		List<ManagerScheduleVO> list=managerScheduleService.selectByPackDno(packDno);
		logger.info("스케줄 목록 list.size={}",list.size());
		
		if(list.size()==0) {
			model.addAttribute("msg", "등록되어 있는 일정이 없어 입력화면으로 이동합니다.");
			model.addAttribute("url", "/manager/schedule/scheduleWrite.do?packDno="+packDno);
			return "common/message";
		}
		
		model.addAttribute("list", list);
		model.addAttribute("dNo", packDno);
		return "manager/schedule/scheduleList";
	}
}
