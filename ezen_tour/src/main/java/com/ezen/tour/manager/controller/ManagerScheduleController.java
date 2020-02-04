package com.ezen.tour.manager.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@ResponseBody
	public void scheduleWrite(HttpServletRequest req, ModelMap model, HttpServletResponse response) throws Exception{
		//일정값 전부 받아오기
		Map<String, String[]> map=req.getParameterMap();
		Set<String> keys=map.keySet();
		Iterator<String> iter=keys.iterator();
		
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
		
		String msg="";
		if(cnt>0) {
			msg="일정 등록에 성공하였습니다.";
		}else {
			msg="일정 등록 실패!";
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.getWriter().write(msg);
	}
}
