package com.ezen.tour.manager.pack.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.manager.packDetail.model.ManagerDetailVO;

@Repository
public class ManagerPackDAOmybatis implements ManagerPackDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.managerPack.";

	@Override
	public int insertPack(ManagerPackVo packVo) {
		return sqlSession.insert(namespace+"insertPack", packVo);
	}

	@Override
	public ManagerPackVo selectPack(int packNo) {
		return sqlSession.selectOne(namespace+"selectPack", packNo);
	}

	@Override
	public int updatePack(ManagerPackVo packVo) {
		return sqlSession.update(namespace+"updatePack", packVo);
	}

	@Override
	public List<ManagerPackViewVO> selectList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectViewList", searchVo);
	}

	@Override
	public int selectTotal(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotal", searchVo);
	}	
}
