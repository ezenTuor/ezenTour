package com.ezen.tour.member.model;

public interface MemberDAO {
	int insertMember(MemberVO vo);
	MemberVO selectMember(String user_id);
	public String selectPwd(String user_id);
	int selectDuplicate(String user_id);
	int editMember(MemberVO vo);
}
