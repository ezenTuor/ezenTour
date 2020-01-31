package com.ezen.tour.coupon.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;

@Repository
public class CouponDAOMybatis implements CouponDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.coupon.";

	@Override
	public List<CouponVO> selectAll(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAll",searchVo);
	}

	@Override
	public int selectTotalRecord(int user_no) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",user_no);
	}

	@Override
	public List<CouponVO> selectAll_N(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAll_N",searchVo);
	}

	@Override
	public int selectTotalRecord_N(int user_no) {
		return sqlSession.selectOne(namespace+"selectTotalRecord_N",user_no);
	}
}
