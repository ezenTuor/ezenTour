package com.ezen.tour.review.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.SearchVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewDAO reviewDao;
	
	public int insertReview(ReviewVO reviewVo) {
		return reviewDao.insertReview(reviewVo);
	}

	@Override
	public List<ReviewViewVO> selectAll(SearchVO searchVo) {
		return reviewDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return reviewDao.selectTotalRecord(searchVo);
	}

	@Override
	public ReviewVO selectByNo(int no) {
		return reviewDao.selectByNo(no);
	}

	@Override
	public int updateReview(ReviewVO reviewVo) {
		return reviewDao.updateReview(reviewVo);
	}

	@Override
	public int deleteReview(int no) {
		return reviewDao.deleteReview(no);
	}
	
}