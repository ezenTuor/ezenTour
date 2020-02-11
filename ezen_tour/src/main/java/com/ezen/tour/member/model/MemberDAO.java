package com.ezen.tour.member.model;

import java.util.List;
import java.util.Map;

import com.ezen.tour.common.SearchVO;

public interface MemberDAO {
	int insertMember(MemberVO vo);
	MemberVO selectMember(String userId);
	public String selectPwd(String userId);
	int selectDuplicate(String userId);
	int memberUpdate(MemberVO vo);
	int deleteMember(String userId);
	int selectUserNo(String userId);
	String FindUserIdByEmail(Map<String, String> map);
	String FindPwd(Map<String, String> map);
	int updateUserPwd(MemberVO vo);
	String findUserIdByUserNo(int userNo);
	
	List<MemberVO> selectAll(SearchVO searchVo);
	int selectTotal(SearchVO searchVo);
}
