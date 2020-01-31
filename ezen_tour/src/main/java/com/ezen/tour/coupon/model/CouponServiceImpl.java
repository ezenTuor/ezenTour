package com.ezen.tour.coupon.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;

@Service
public class CouponServiceImpl implements CouponService{
	@Autowired
	private CouponDAO couponDao;

	@Override
	public List<CouponVO> selectAll(SearchVO searchVo) {
		return couponDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(int user_no) {
		return couponDao.selectTotalRecord(user_no);
	}

	@Override
	public List<CouponVO> selectAll_N(SearchVO searchVo) {
		return couponDao.selectAll_N(searchVo);
	}

	@Override
	public int selectTotalRecord_N(int user_no) {
		return couponDao.selectTotalRecord_N(user_no);
	}
}
