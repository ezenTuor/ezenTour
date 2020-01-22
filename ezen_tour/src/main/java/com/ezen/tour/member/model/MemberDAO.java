package com.ezen.tour.member.model;

import java.util.List;
import java.util.Map;

public interface MemberDAO {
	int insertMember(MemberVO vo);
	MemberVO selectMember(String user_id);
	public String selectPwd(String user_id);
	int selectDuplicate(String user_id);
	int memberUpdate(MemberVO vo);
	int deleteMember(String user_id);
	int selectUser_no(String user_id);
	String FindUserIdByEmail(Map<String, String> map);
	String FindPwd(Map<String, String> map);
}
