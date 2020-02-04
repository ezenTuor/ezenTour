package com.ezen.tour.coupon.model;

import java.util.List;
import java.util.Map;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;

public interface CouponService {
	List<CouponVO> selectAll(SearchVO searchVo);
	int selectTotalRecord(int userNo);
	List<CouponVO> selectAll_N(SearchVO searchVo);
	int selectTotalRecord_N(int userNo);
}
