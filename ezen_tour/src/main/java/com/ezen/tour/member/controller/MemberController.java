package com.ezen.tour.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.tour.member.model.MemberService;
import com.ezen.tour.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger
		=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login_get() {
		logger.info("로그인 화면 보여주기");
		
		return "member/login";
	}
	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login_post(@RequestParam String user_id,
			@RequestParam String user_pwd, 
			@RequestParam(required = false) String chkSave,
			Model model, HttpServletRequest request,
			HttpServletResponse response) {

		logger.info("로그인 처리, 파라미터 userid={}, pwd={}", user_id, user_pwd);
		logger.info("chkSave={}", chkSave);
		
		int result=memberService.loginCheck(user_id, user_pwd);
		String msg="", url="/login/login.do";
		if(result==MemberService.LOGIN_OK) {
			MemberVO vo = memberService.selectMember(user_id);
			
			HttpSession session=request.getSession();
			session.setAttribute("user_id", user_id);
			session.setAttribute("name", vo.getName());
						
			Cookie ck = new Cookie("ck_userid", user_id);
			ck.setPath("/");
			if(chkSave!=null) {
				ck.setMaxAge(1000*24*60*60);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			msg=vo.getName() +" 로그인되었습니다.";
			url="/index.do";
		}else if(result==MemberService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else if(result==MemberService.NONE_USERID) {
			msg="해당 아이디가 존재하지 않습니다.";			
		}else {
			msg="로그인 처리 실패!";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		session.removeAttribute("name");
		
		return "redirect:/index.do";
	}
	@RequestMapping("/register.do")
	public void register() {
		logger.info("회원가입 화면 보여주기");		
	}
	
	@RequestMapping("/memberWrite.do")
	public String memberInsert(@ModelAttribute MemberVO vo, 
			@RequestParam String email3,
			ModelMap model) {
		logger.info("회원가입 처리, 파라미터 vo={}, email3={}", vo, email3);
		
		String hp1=vo.getHp1();
		String hp2=vo.getHp2();
		String hp3=vo.getHp3();
		if(hp2==null || hp2.isEmpty() || hp3==null || hp3.isEmpty()) {
			vo.setHp1("");
			vo.setHp2("");
			vo.setHp3("");			
		}
		
		String email1=vo.getEmail1();
		String email2=vo.getEmail2();
		if(email1==null || email1.isEmpty()) {
			vo.setEmail2("");
		}else {
			if(email2.equals("etc")) {
				if(email3!=null && !email3.isEmpty()) {
					vo.setEmail2(email3);
				}else {
					vo.setEmail1("");
					vo.setEmail2("");					
				}
			}
		}
		
		logger.info("값 변경 후 vo={}", vo);
		
		int cnt=memberService.insertMember(vo);
		logger.info("회원가입 결과, cnt={}", cnt);
				
		String msg="", url="";
		if(cnt>0) {
			msg="회원가입되었습니다.";
			url="/index.do";
		}else {
			msg="회원가입 실패";
			url="/member/register.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";				
	}
	
	@RequestMapping("/idCheck.do")
	public String checkUserid(@RequestParam String user_id,
			Model model) {
		logger.info("아이디 중복확인, 파라미터 userid={}", user_id);
		
		int result=0;
		
		if(user_id!=null && !user_id.isEmpty()) {
			result=memberService.selectDuplicate(user_id);
			logger.info("아이디 중복확인 결과, result={}", result);
		}
		
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID", MemberService.EXIST_ID);
		model.addAttribute("USEFUL_ID", MemberService.USEFUL_ID);
		
		return "member/idCheck";
	}
	
	
}
