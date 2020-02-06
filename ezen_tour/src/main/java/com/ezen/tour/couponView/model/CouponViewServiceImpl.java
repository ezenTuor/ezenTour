package com.ezen.tour.couponView.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;

@Service
public class CouponViewServiceImpl implements CouponViewService{
	@Autowired
	private CouponViewDAO couponViewDao;
	
	@Override
	public List<CouponViewVO> selectAll(MemberVO memberVo) {
		return couponViewDao.selectAll(memberVo);
	}

	@Override
	public int selectTotalRecord(int userNo) {
		return couponViewDao.selectTotalRecord(userNo);
	}

	@Override
	public List<CouponViewVO> selectAll_N(MemberVO memberVo) {
		return couponViewDao.selectAll_N(memberVo);
	}

	@Override
	public int selectTotalRecord_N(int userNo) {
		return couponViewDao.selectTotalRecord_N(userNo);
	}
}
