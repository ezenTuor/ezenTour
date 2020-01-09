package com.ezen.tour.member.model;

public interface MemberService {
	
	public static final int EXIST_ID=1;  //아이디가 이미 존재하는 경우
	public static final int USEFUL_ID=2;  //아이디가 사용 가능한 경우
	
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int DISAGREE_PWD=2; //비밀번호 불일치
	int NONE_USERID=3;
	
	int insertMember(MemberVO vo);
	MemberVO selectMember(String user_id);
	public int loginCheck(String user_id, String user_pwd);
	int selectDuplicate(String  user_id);
}
