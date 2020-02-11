package com.ezen.tour.support.model;

import java.util.List;

import com.ezen.tour.member.model.MemberVO;

public interface SupportService {
	List<SupportVO> selectAll(MemberVO vo);
	int selectTotalRecord(MemberVO vo);
	int insertSupport(SupportVO vo);
	SupportVO selectSupportByNo (int supportNo);
	int editSupport(SupportVO vo);
	SupportVO selectByNo(int supportNo);
	int supportReply(SupportVO vo);
	SupportVO selectReply(int groupNo);
}
