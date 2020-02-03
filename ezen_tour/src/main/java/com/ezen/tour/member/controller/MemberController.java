package com.ezen.tour.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
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

import com.ezen.tour.common.Utility;
import com.ezen.tour.member.controller.EmailSender;
import com.ezen.tour.member.model.MemberService;
import com.ezen.tour.member.model.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger
		=LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;
	@Autowired
	private EmailSender emailSender;

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
		int user_no = 0;
		String msg="", url="/member/login.do";
		if(result==MemberService.LOGIN_OK) {
			MemberVO vo = memberService.selectMember(user_id);
			
			user_no = vo.getUser_no();
			
			HttpSession session=request.getSession();
			session.setAttribute("user_id", user_id);
			session.setAttribute("name", vo.getName());
			session.setAttribute("user_no", user_no);
						
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
	public String write(@ModelAttribute MemberVO vo, 
			@RequestParam(required = false) String email3,
			Model model) {
		
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
		logger.info("아이디 중복확인, 파라미터 user_id={}", user_id);
		
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
	@RequestMapping(value="/memberEdit.do", method = RequestMethod.GET)
	public String memberEdit_get(HttpSession session, Model model) {
		String user_id=(String) session.getAttribute("user_id");		
		logger.info("회원수정 화면 보여주기, 파라미터 user_id={}", user_id);
		
		MemberVO vo=memberService.selectMember(user_id);
		logger.info("회원정보 조회 결과, vo={}", vo);
		
		model.addAttribute("vo", vo);
		
		return "member/memberEdit";		
	}
	
	@RequestMapping(value="/memberEdit.do", method = RequestMethod.POST)
	public String memberEdit_post(@ModelAttribute MemberVO vo,
			@RequestParam(required = false) String email3,
			HttpSession session, Model model) {
		String user_id=(String) session.getAttribute("user_id");
		vo.setUser_id(user_id);
		logger.info("회원수정처리, 파라미터 vo={}, email3={}", vo, email3);
				
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
			email1="";
			email2="";			
		}else {
			if(email2.equals("etc")) {
				if(email3!=null && !email3.isEmpty()) {
					email2=email3;
				}else {
					email1="";
					email2="";
				}
			}
		}
		vo.setEmail1(email1);
		vo.setEmail2(email2);
		
		int result=memberService.loginCheck(user_id, vo.getUser_pwd());
		
		String msg="", url="/member/memberEdit.do";
		if(result==MemberService.LOGIN_OK) {
			int cnt=memberService.memberUpdate(vo);
			if(cnt>0) {
				msg="회원정보 수정되었습니다.";
			}else {
				msg="회원정보 수정 실패!";
			}		
		}else if(result==MemberService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else {
			msg="비밀번호 체크 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	@RequestMapping(value = "/memberOut.do", method = RequestMethod.GET)
	public void memberOut_get() {
		logger.info("회원탈퇴 화면 보여주기");
	}
	
	@RequestMapping(value="/memberOut.do", method=RequestMethod.POST)
	public String memberOut_post(@RequestParam String pwd,
			HttpSession session, Model model,
			HttpServletResponse response) {
		String user_id=(String) session.getAttribute("user_id");		
		logger.info("회원탈퇴, 파라미터 user_id={}, pwd={}", user_id, pwd);
		
		int result=memberService.loginCheck(user_id, pwd);
		logger.info("비밀번호 체크 결과, result={}", result);
		
		String msg="", url="/member/memberOut.do";
		if(result==MemberService.LOGIN_OK) {
			int cnt=memberService.deleteMember(user_id);
			if(cnt>0) {
				msg="회원탈퇴 처리되었습니다.";
				url="/index.do";
				
				session.invalidate();
				
				Cookie ck = new Cookie("ck_userid", user_id);
				ck.setPath("/");
				ck.setMaxAge(0);
				response.addCookie(ck);
			}else {
				msg="회원탈퇴 실패";
			}
		}else if(result==MemberService.DISAGREE_PWD) {
			msg="비밀번호가 일치하지 않습니다.";
		}else {
			msg="비밀번호 체크 실패!";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	@RequestMapping(value = "/idFind.do", method = RequestMethod.GET)
	public void findIdByEmail_get() {
		logger.info("아이디 찾기 처리");
	}
	
	
	
	@RequestMapping(value = "/idFind.do", method = RequestMethod.POST)
	public String findIdByEmail(@ModelAttribute MemberVO vo, 
			@RequestParam(required = false) String email3,
			Model model) {
		
		logger.info("이메일로 아이디 찾기 처리, 파라미터 vo={}, email3={}", vo, email3);
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
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("email1", email1);
		map.put("email2", email2);
		
		
		String user_id = "";
		user_id=memberService.FindUserIdByEmail(map);
		logger.info("아이디 찾기 결과, user_id={}", user_id);
		
		String subject="아이디 찾기에 대한 답변입니다.";
		String content="회원님의 아이디는 ["+user_id+"] 입니다.";
		String receiver=email1+"@"+email2;
		String sender=email1+"@"+email2;
				
		try {
			emailSender.sendMail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공");
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패!!");
			e.printStackTrace();
		}
		
		String msg="", url="/member/idFind.do";
		if(user_id!=null && !user_id.isEmpty()) {
			msg="회원님의 아이디는 ["+user_id+"] 입니다.";
		}else {
			msg="등록된 아이디가 없습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	@RequestMapping(value = "/pwdFind.do", method = RequestMethod.GET)
	public void findUser_Pwd_get() {
		logger.info("비밀번호 찾기 화면 띄우기");
	}
	
	@RequestMapping(value = "/pwdFind.do", method = RequestMethod.POST)
	public String findUser_Pwd(@ModelAttribute MemberVO vo, 
			@RequestParam(required = false) String email3,
			Model model,
			HttpSession session, HttpServletRequest request) {
		logger.info("비밀번호 찾기 처리, 파라미터 vo={}, email3={}", vo, email3);
		String user_id = vo.getUser_id();
		String email1=vo.getEmail1();
		String email2=vo.getEmail2();
		if(email1==null || email1.isEmpty()) {
			vo.setEmail2("");
		}else {
			if(email2.equals("etc")) {
				if(email3!=null && !email3.isEmpty()) {
					vo.setEmail2(email3);
				}else{
					vo.setEmail1("");
					vo.setEmail2("");					
				}
			}
		}
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("email1", email1);
		map.put("email2", email2);
		
		String result = memberService.FindUserIdByEmail(map);
		int cnt = memberService.selectDuplicate(user_id);
		
		String msg = "", url ="";
		if(result == null || result.isEmpty() || cnt==0) {
			msg = "입력하신 정보가 정확하지 않습니다.";
			url = "/pwdFind.do";
		}else {
			msg = "이메일 확인되었습니다. 인증번호가 전송되었습니다.";
			url = "/certified.do";
			
			String sb = Utility.randomNum();
			String subject="비밀번호 찾기에 대한 답변입니다.";
			String content="회원님의 인증번호는 ["+sb.toString()+"] 입니다.";
			String receiver=email1+"@"+email2;
			String sender=email1+"@"+email2;
			
			session.setAttribute("user_id_newPwd", user_id);
			session.setAttribute("sb", sb);
			session.setMaxInactiveInterval(3*60);
			
			try {
				emailSender.sendMail(subject, content, receiver, sender);
				logger.info("이메일 발송을 성공했습니다.");
			} catch (MessagingException e) {
				logger.info("이메일 발송을 실패했습니다.");
				e.printStackTrace();
			}
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	@RequestMapping("/certify.do")
	public String certify(@RequestParam String cer_num, HttpSession session,
			Model model) {
		logger.info("인증번호 처리");
		
		String sb = (String)session.getAttribute("sb");
		
		String msg = "", url = "";
		if(sb==cer_num) {
			msg = "인증되었습니다.";
			url = "/newPwd.do";
		}else {
			msg = "인증에 실패하였습니다.";
			url = "/certified.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	@RequestMapping("/newPwd.do")
	public String newPwd(@RequestParam String new_Pwd, HttpSession session,
			Model model) {
		logger.info("비밀번호 변경 처리");
		String user_id_newPwd = (String)session.getAttribute("user_id_newPwd");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_id_newPwd", user_id_newPwd);
		map.put("new_Pwd", new_Pwd);
		
		int cnt = memberService.updateUser_Pwd(map);
		String msg = "", url = "/login.do";
		if(cnt>0) {
			msg = "비밀번호가 변경되었습니다.";
		}else {
			msg = "비밀번호 변경을 실패하였습니다.";
		}
		session.removeAttribute("user_id_newPwd");
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
}