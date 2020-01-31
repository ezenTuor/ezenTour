package com.ezen.tour.country.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CountryDAOmybatis implements CountryDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace="config.mybatis.mapper.oracle.country.";
	@Override
	public List<CountryVO> selectAll() {
		return sqlSession.selectList(namespace+"selectall");
	}
}
