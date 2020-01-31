package com.ezen.tour.review.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;

public interface ReviewService {
	public int insertReview(ReviewVO reviewVo);
	public List<ReviewVO> selectAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	public ReviewVO selectByNo(int no);
	public int updateReview(ReviewVO reviewVo);
	public int deleteReview(int no);
	
}