package com.ezen.tour.couponView.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.coupon.model.CouponVO;
import com.ezen.tour.member.model.MemberVO;

@Repository
public class CouponViewDAOMybatis implements CouponViewDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.coupon.";
	
	@Override
	public List<CouponViewVO> selectAll(MemberVO memberVo) {
		return sqlSession.selectList(namespace+"selectAll",memberVo);
	}

	@Override
	public int selectTotalRecord(int userNo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",userNo);
	}

	@Override
	public List<CouponViewVO> selectAll_N(MemberVO memberVo) {
		return sqlSession.selectList(namespace+"selectAll_N",memberVo);
	}

	@Override
	public int selectTotalRecord_N(int userNo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord_N",userNo);
	}
}
