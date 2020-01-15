package com.ezen.tour.coupon.model;

import java.util.List;
import java.util.Map;

public interface CouponService {
	List<Map<String, Object>> selectUsefulCoupon(int user_no);
}
