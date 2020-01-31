package com.ezen.tour.manager.areadetail.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AreaDetailDAOmybatis implements AreaDetailDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.managerArea.";
	
	@Override
	public List<ManagerAreaDetailVO> selectAreaDetail(int areaNo){
		return sqlSession.selectList(namespace+"selectAreaDetail", areaNo);
	}
}
