package com.ezen.tour.history.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.common.HistorySearchVO;

@Repository
public class HistoryDAOMyBatis implements HistoryDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.history.";

	@Override
	public List<HistoryViewVO> selectHistory(int userNo) {
		return sqlSession.selectList(namespace+"selectHistory", userNo);
	}

	@Override
	public int reviewUpdate(int historyNo) {
		return sqlSession.update(namespace+"reviewUpdate", historyNo);
	}

	@Override
	public List<HistoryViewVO> historyChoosePack(int historyNo) {
		return sqlSession.selectList(namespace+"historyChoosePack", historyNo);
	}

	@Override
	public List<HistoryViewVO> selectMtoM(HistorySearchVO vo) {
		return sqlSession.selectList(namespace+"selectMtoM", vo);
	}

	@Override
	public List<HistoryViewVO> selectAll(int userNo) {
		return sqlSession.selectList(namespace+"selectAll", userNo);
	}

	@Override
	public List<HistoryViewVO> reviewChoosePack() {
		return sqlSession.selectList(namespace+"reviewChoosePack");
	}
	
}