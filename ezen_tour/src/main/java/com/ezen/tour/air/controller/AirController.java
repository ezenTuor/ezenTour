package com.ezen.tour.air.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/air")
public class AirController {
	private final static Logger logger=LoggerFactory.getLogger(AirController.class);
	
	@RequestMapping("/airList.do")
	public void airList() {
		logger.info("항공편 보여주기");
	}
}