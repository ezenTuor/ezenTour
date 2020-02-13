package com.ezen.tour.manager.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.tour.manager.chart.model.ChartService;
import com.ezen.tour.manager.chart.model.ChartVO;
import com.ezen.tour.manager.chart.model.SearchChartVO;

@Controller
@RequestMapping("/manager/chart")
public class ManagerChartController {
	private Logger logger=LoggerFactory.getLogger(ManagerChartController.class);
	
	@Autowired
	private ChartService chartService;
	
	@RequestMapping("/charList.do")
	public void chart(@ModelAttribute SearchChartVO searchChartVo, Model model) {
		logger.info("차트 보여주기, 파라미터 searchChartVo={}", searchChartVo);
		
		List<ChartVO> list=chartService.selectChart(searchChartVo);
		logger.info("차트 조회 결과, list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("searchVo", searchChartVo);
	}
}
