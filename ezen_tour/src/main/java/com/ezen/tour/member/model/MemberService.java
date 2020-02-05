package com.ezen.tour.member.model;

import java.util.List;
import java.util.Map;

public interface MemberService {
	
	public static final int EXIST_ID=1;  //아이디가 이미 존재하는 경우
	public static final int USEFUL_ID=2;  //아이디가 사용 가능한 경우
	
	public static final int LOGIN_OK=1;  //로그인 성공
	public static final int DISAGREE_PWD=2; //비밀번호 불일치
	int NONE_USERID=3;
	
	int insertMember(MemberVO vo);
	MemberVO selectMember(String userId);
	public int loginCheck(String userId, String userPwd);
	int selectDuplicate(String  userId);
	int memberUpdate(MemberVO vo);
	int deleteMember(String userId);
	int selectUserNo(String userId);
	String FindUserIdByEmail(Map<String, String> map);
	String FindPwd(Map<String, String> map);
	int updateUserPwd(MemberVO vo);
}
