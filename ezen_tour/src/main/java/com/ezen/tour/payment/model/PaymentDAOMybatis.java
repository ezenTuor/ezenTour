package com.ezen.tour.payment.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAOMybatis implements PaymentDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.payment.";

	@Override
	public int insertPayment(PaymentVO vo) {
		int cnt=sqlSession.insert(namespace+"insertPayment", vo);
		return cnt;
	}
}
