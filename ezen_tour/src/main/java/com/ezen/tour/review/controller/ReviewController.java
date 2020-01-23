package com.ezen.tour.review.controller;

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

import com.ezen.tour.common.PaginationInfo;
import com.ezen.tour.common.SearchVO;
import com.ezen.tour.common.Utility;
import com.ezen.tour.review.model.ReviewService;
import com.ezen.tour.review.model.ReviewVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	private static final Logger logger=LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/write.do", method=RequestMethod.GET)
	public void write_get() {
		logger.info("리뷰 작성 화면 보여주기");
		
		//requestparam으로 userno, historyno값 받아서 model에 담아 넘기기 
	}
	
	@RequestMapping(value="/write.do", method=RequestMethod.POST)
	public String write_post(@ModelAttribute ReviewVO reviewVo, Model model) {
		//review_no, user_no, history_no=?
		logger.info("리뷰 작성하기, 파라미터 reviewVo={}", reviewVo);
		
		int cnt=reviewService.insertReview(reviewVo);
		logger.info("작성 결과={}", cnt);
		
		String msg="", url="";
		
		if(cnt>0) {
			msg="리뷰 작성 완료";
			url="/review/list.do";
		}else {
			msg="리뷰 작성 실패";
			url="/review/write.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@RequestMapping("/list.do")
	public void list(@ModelAttribute SearchVO vo, Model model) {
		logger.info("리뷰 목록, 파라미터={}", vo);
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		logger.info("값 셋팅 후 vo={}", vo);
		
		List<ReviewVO> list=reviewService.selectAll(vo);
		logger.info("글목록 결과, list.size={}", list.size());
		
		int totalRecord=reviewService.selectTotalRecord(vo);
		logger.info("totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
	}
	
	@RequestMapping("/detail.do")
	public String detail(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("상세 보기 번호, no={}", no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 접근");
			model.addAttribute("url", "/review/list.do");
			
			return "common/message";
		}
		
		ReviewVO reviewVo=reviewService.selectByNo(no);
		logger.info("상세보기 결과, reviewVo={}", reviewVo);
		
		model.addAttribute("vo", reviewVo);
		
		return "review/detail";
	}
	
	@RequestMapping("/delete.do")
	public String delete(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("글 삭제 번호 no={}", no);
		
		if(no==0) {
			model.addAttribute("msg","잘못된 접근");
			model.addAttribute("url","/review/list.do");
			
			return "common/message";
		}
		
		String msg="", url="";
		
		int cnt=reviewService.deleteReview(no);
		if(cnt>0) {
			msg="리뷰 삭제 성공";
			url="/review/list.do";
		}else {
			msg="리뷰 삭제 실패";
			url="/reveiw/detail.do?no="+no;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/edit.do", method =RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("리뷰 수정 번호, no={}", no);
		
		if(no==0) {
			model.addAttribute("msg", "잘못된 경로");
			model.addAttribute("url", "/review/list.do");
			
			return "common/message";
		}
		
		ReviewVO reviewVo=reviewService.selectByNo(no);
		logger.info("수정 결과, reviewVo={}", reviewVo);
		
		model.addAttribute("reviewVo", reviewVo);
		
		return "review/edit";
	}
	
	@RequestMapping(value="/edit.do", method = RequestMethod.POST)
	public String edit_post(@ModelAttribute ReviewVO reviewVo, @RequestParam(defaultValue = "0") int reviewNo, Model model) {
		logger.info("글 번호 reviewNo={}, 수정처리 reviewVo={}", reviewNo, reviewVo);
		
		String msg="", url="";
		int cnt=reviewService.updateReview(reviewVo);
		logger.info("수정 결과, cnt={}", cnt);
		
		if(cnt>0) {
			msg="수정 성공";
			url="/review/detail.do?no="+reviewNo;
		}else {
			msg="수정 실패";
			url="/review/edit.do?no="+reviewNo;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}