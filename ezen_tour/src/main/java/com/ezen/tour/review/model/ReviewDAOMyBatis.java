package com.ezen.tour.review.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOMyBatis implements ReviewDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.review.";
	
	public int insertReview(ReviewVO vo) {
		return sqlSession.insert(namespace+"insertReview"+vo);
	}
	
}