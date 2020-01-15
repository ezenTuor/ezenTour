package com.ezen.tour.coupon.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAOMybatis implements CouponDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.coupon.";
	
	@Override
	public List<Map<String, Object>> selectUsefulCoupon(int user_no) {
		return sqlSession.selectList(namespace+"selectUsefulCoupon",user_no);
	}
	
}
