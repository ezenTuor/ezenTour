package com.ezen.tour.pack.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class PackDetailDAOMybatis implements PackDetailDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.mybatis.mapper.pack";
	
	@Override
	public List<PackDetailVO> selectPackDetailList(String packNo){
		return sqlSession.selectList(namespace+"selectPackDetailList", packNo);
	}

}
