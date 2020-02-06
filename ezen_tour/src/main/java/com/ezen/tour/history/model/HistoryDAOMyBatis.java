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
	public List<HistoryViewVO> selectAll(int userNo) {
		return sqlSession.selectList(namespace+"selectAll", userNo);
	}

	@Override
	public int reviewUpdate(int historyNo) {
		return sqlSession.update(namespace+"reviewUpdate", historyNo);
	}

	@Override
	public List<HistoryViewVO> choosePack() {
		return sqlSession.selectList(namespace+"choosePack");
	}
	
}