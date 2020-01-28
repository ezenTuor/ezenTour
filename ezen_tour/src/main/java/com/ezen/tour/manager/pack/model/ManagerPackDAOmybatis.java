package com.ezen.tour.manager.pack.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<ManagerPackVo> selectList() {
		return sqlSession.selectList(namespace+"");
	}
}
