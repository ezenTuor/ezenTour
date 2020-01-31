package com.ezen.tour.mileage.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.common.SearchVO;

@Repository
public class MileageDAOMybatis implements MileageDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.mileage.";
	@Override
	public List<MileageVO> selectAll(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAll",searchVo);
	}

	@Override
	public int selectTotalRecord(int user_no) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",user_no);
	}
}
