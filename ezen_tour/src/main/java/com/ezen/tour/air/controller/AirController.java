package com.ezen.tour.air.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AirController {
	private final static Logger logger=LoggerFactory.getLogger(AirController.class);
	
	@RequestMapping("/air/airList.do")
	public void airList(Model model) {
		logger.info("항공편 보여주기");
	}
	
	@RequestMapping("/airLine.do")
	@ResponseBody
	public String airLine() {
		logger.info("airLine.do 처리화면");
		String re="";
		try {
			//http://openapi.airport.co.kr/service/rest/AirportCodeList/getAirportCodeList?ServiceKey=인증키(서비스키)&SchLineType=D
			StringBuilder urlBuilder=new StringBuilder("http://openapi.airport.co.kr/service/rest/FlightScheduleList/getIflightScheduleList"); /*URL*/
			urlBuilder.append("?"+URLEncoder.encode("ServiceKey","UTF-8")+"=5XAbnLZcjQ8l%2FOBapLyPBg%2F0hQmbksmMRPvXPqyieB1IE76g8%2BJvU6ttkth2mLdeh2YUTaPVMwW2SfNMDzRCxg%3D%3D"); /*Service Key*/
			
			//필수 키
			urlBuilder.append("&"+URLEncoder.encode("schDate","UTF-8")+"="+URLEncoder.encode("20151005", "UTF-8")); /*검색일자*/
			urlBuilder.append("&"+URLEncoder.encode("schDeptCityCode","UTF-8")+"="+URLEncoder.encode("GMP", "UTF-8")); /*출발 도시 코드*/
			urlBuilder.append("&"+URLEncoder.encode("schArrvCityCode","UTF-8")+"="+URLEncoder.encode("HND", "UTF-8")); /*도착 도시 코드*/
			//urlBuilder.append("&"+URLEncoder.encode("schAirLine","UTF-8")+"="+URLEncoder.encode("NH", "UTF-8")); /*항공편 코드*/
			//urlBuilder.append("&"+URLEncoder.encode("schFlightNum","UTF-8")+"="+URLEncoder.encode("NH862", "UTF-8")); /*항공편 넘버*/
			//urlBuilder.append("&"+URLEncoder.encode("serviceKey","UTF-8")+"="+URLEncoder.encode("", "UTF-8")); /*인증키*/
			
			//페이징 처리
			//urlBuilder.append("&"+URLEncoder.encode("numOfRows", "UTF-8")+"="+URLEncoder.encode("2", "UTF-8")); /*보여줄 개수*/
			//urlBuilder.append("&"+URLEncoder.encode("pageNo", "UTF-8")+"="+URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
			
			URL url=new URL(urlBuilder.toString());
			HttpURLConnection conn=(HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
	        logger.info("Response code: {}", conn.getResponseCode());
	        
	        BufferedReader rd;
	        if(conn.getResponseCode()>=200 && conn.getResponseCode()<=300) {
	        	rd=new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        } else {
	        	rd=new BufferedReader(new InputStreamReader(conn.getErrorStream()));
	        }
	        
	        StringBuilder sb=new StringBuilder();
	        String line;
	        while((line=rd.readLine())!=null) {
	        	sb.append(line);
	        }
	        re+=sb;
	        rd.close();
	        conn.disconnect();
	        logger.info("sb.toString={}", sb.toString());
	        
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return re.toString();
	}
	
	
	
	@RequestMapping("/airTest.do")
	@ResponseBody
	public String airTest() {
		String test="TEST";
		
		return test;
	}
}