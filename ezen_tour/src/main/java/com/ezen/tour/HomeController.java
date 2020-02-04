package com.ezen.tour;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.tour.pack.model.AreaVO;
import com.ezen.tour.pack.model.PackDetailService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private PackDetailService packDetailService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping("/home.do")
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	
	@RequestMapping("/index.do")
	public String index(Locale locale, Model model) {
		
		return "index";
	}
	
	
	@RequestMapping("/inc/top.do")
	public void top(Model model) {
		List<AreaVO> areaLi = packDetailService.areaSelect();
		
		model.addAttribute("areaLi", areaLi);
		
		logger.info("top");
		
		//return "/inc/top";
	}
	
}
