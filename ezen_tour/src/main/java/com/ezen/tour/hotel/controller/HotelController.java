package com.ezen.tour.hotel.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hotel")
public class HotelController {
	private final static Logger logger=LoggerFactory.getLogger(HotelController.class);
	
	@RequestMapping("/hotelList.do")
	public void hotelList() {
		logger.info("호텔 리스트 보여주기");
	}
	
	@RequestMapping("/test.do")
	public void test() {
		
	}
	
}