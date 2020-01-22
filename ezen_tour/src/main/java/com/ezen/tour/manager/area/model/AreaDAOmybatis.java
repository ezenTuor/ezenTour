package com.ezen.tour.manager.area.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AreaDAOmybatis implements AreaDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.managerArea.";

	@Override
	public List<ManagerAreaVO> selectArea() {
		return sqlSession.selectList(namespace+"selectArea");
	}
}
