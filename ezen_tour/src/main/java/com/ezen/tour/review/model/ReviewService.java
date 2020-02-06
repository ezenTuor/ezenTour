package com.ezen.tour.review.model;

import java.util.List;
import java.util.Map;

import com.ezen.tour.common.SearchVO;

public interface ReviewService {
	public int insertReview(ReviewVO reviewVo);
	public List<ReviewViewVO> selectAll(SearchVO searchVo);
	public int selectTotalRecord(SearchVO searchVo);
	public ReviewViewVO selectByNo(int no);
	public int updateReview(ReviewVO reviewVo);
	public int deleteReview(int no);
	public Map<String, Object> selectReviewMap(int no);
	
}