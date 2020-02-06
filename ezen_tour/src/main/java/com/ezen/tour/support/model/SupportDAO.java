package com.ezen.tour.support.model;

import java.util.List;

import com.ezen.tour.member.model.MemberVO;

public interface SupportDAO {
	List<SupportVO> selectAll(MemberVO vo);
	int selectTotalRecord(MemberVO vo);
	int insertSupport(SupportVO vo);
	SupportVO selectSupportByNo (int supportNo);
}
