package com.ezen.tour.history.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HistoryDAOMyBatis implements HistoryDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.history.";

	@Override
	public List<HistoryVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}

	@Override
	public int reviewUpdate(HistoryVO historyVo) {
		return sqlSession.update(namespace+"reviewUpdate", historyVo);
	}
	
}