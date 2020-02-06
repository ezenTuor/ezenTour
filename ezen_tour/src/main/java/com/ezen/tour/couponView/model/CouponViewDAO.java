package com.ezen.tour.couponView.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.coupon.model.CouponVO;
import com.ezen.tour.member.model.MemberVO;

public interface CouponViewDAO {
	List<CouponViewVO> selectAll(MemberVO memberVo);
	int selectTotalRecord(int userNo);
	List<CouponViewVO> selectAll_N(MemberVO memberVo);
	int selectTotalRecord_N(int userNo);
}
