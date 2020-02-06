package com.ezen.tour.couponView.model;

import java.util.List;

import com.ezen.tour.member.model.MemberVO;

public interface CouponViewService {
	List<CouponViewVO> selectAll(MemberVO memberVo);
	int selectTotalRecord(int userNo);
	List<CouponViewVO> selectAll_N(MemberVO memberVo);
	int selectTotalRecord_N(int userNo);
}
