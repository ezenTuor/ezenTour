package com.ezen.tour.mileage.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;

@Repository
public class MileageDAOMybatis implements MileageDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.mileage.";
	@Override
	public List<MileageVO> selectAll(MemberVO memberVo) {
		return sqlSession.selectList(namespace+"selectAll",memberVo);
	}

	@Override
	public int selectTotalRecord(int userNo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",userNo);
	}
}
