package com.ezen.tour.mileage.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;

public interface MileageService {
	List<MileageVO> selectAll(SearchVO searchVo);
	int selectTotalRecord(int user_no);
}
