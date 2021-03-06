package com.ezen.tour.payment.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.member.model.MemberVO;

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

	@Override
	public List<PaymentVO> selectAll(MemberVO memberVo) {
		return sqlSession.selectList(namespace+"selectAll",memberVo);
	}

	@Override
	public PaymentVO selectByNo(int paymentNo) {
		return sqlSession.selectOne(namespace+"selectByNo",paymentNo);
	}
}
