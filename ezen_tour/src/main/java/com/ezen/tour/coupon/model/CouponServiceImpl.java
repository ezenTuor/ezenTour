package com.ezen.tour.coupon.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponServiceImpl implements CouponService{
	@Autowired
	private CouponDAO couponDao;

	@Override
	public List<Map<String, Object>> selectUsefulCoupon(int user_no) {
		return couponDao.selectUsefulCoupon(user_no);
	}
}
