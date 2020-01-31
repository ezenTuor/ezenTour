package com.ezen.tour.review.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.common.SearchVO;

@Repository
public class ReviewDAOMyBatis implements ReviewDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.review.";
	
	public int insertReview(ReviewVO reviewVo) {
		return sqlSession.insert(namespace+"insertReview", reviewVo);
	}

	@Override
	public List<ReviewViewVO> selectAll(SearchVO searchVo) {
		List<ReviewViewVO> list=sqlSession.selectList(namespace+"selectAll", searchVo);
		
		return list;
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", searchVo);
	}

	@Override
	public ReviewVO selectByNo(int no) {
		return sqlSession.selectOne(namespace+"selectByNo", no);
	}

	@Override
	public int updateReview(ReviewVO reviewVo) {
		return sqlSession.update(namespace+"updateReview", reviewVo);
	}

	@Override
	public int deleteReview(int no) {
		return sqlSession.delete(namespace+"deleteReview", no);
	}
	
}