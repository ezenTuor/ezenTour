package com.ezen.tour.review.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDao;
	
	public int insertReview(ReviewVO vo) {
		return reviewDao.insertReview(vo);
	}
	
}