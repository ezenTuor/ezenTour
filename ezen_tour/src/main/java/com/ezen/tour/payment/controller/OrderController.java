package com.ezen.tour.payment.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/payment")
public class OrderController {
	public static final Logger logger
		=LoggerFactory.getLogger(OrderController.class);
	
	@RequestMapping("order.do")
	public void order() {
		logger.info("결제 전 페이지 띄워주기");
	}
}
