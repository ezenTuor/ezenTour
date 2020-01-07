package com.ezen.tour.member.model;

public interface MemberDAO {
	int insertMember(MemberVO vo);
	MemberVO selectMember(String userid);
	public String selectPwd(String userid);
}
