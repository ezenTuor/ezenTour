package com.ezen.tour.support.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;

public interface SupportService {
	List<SupportViewVO> selectAll(MemberVO vo);
	int selectTotalRecord(MemberVO vo);
	int insertSupport(SupportVO vo);
	SupportViewVO selectSupportByNo (int supportNo);
	int editSupport(SupportVO vo);
	SupportViewVO selectByNo(int supportNo);
	List<SupportViewVO> selectmySupport(MemberVO vo);
	List<SupportVO> selectReply(int groupNo);
	List<SupportViewVO> selectAdmin(SearchVO searchVo);
	int selectAdminTotal(SearchVO searchVo);
}
