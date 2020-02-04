package com.ezen.tour.manager.packDetail.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDetailDAOmybatis implements ManagerDetailDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.managerDetail.";
	@Override
	public int insertDetail(ManagerDetailVO detailVo) {
		return sqlSession.insert(namespace+"insertDetail", detailVo);
	}

	@Override
	public ManagerDetailVO selectDetail(int packDno) {
		return sqlSession.selectOne(namespace+"selectDetail", packDno);
	}

	@Override
	public List<ManagerDetailVO> selectDetailsByPackNo(int packNo) {
		return sqlSession.selectList(namespace+"selectByPackNo", packNo);
	}
}
