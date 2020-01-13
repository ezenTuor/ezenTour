package com.ezen.tour.pack.model;

import java.util.List;

public interface PackDetailService {
	List<PackVO> selectPackDetailList(int packNo);
	PackDetailVO selectPackDetail(int packDno);
}
