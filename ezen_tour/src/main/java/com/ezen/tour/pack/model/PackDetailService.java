package com.ezen.tour.pack.model;

import java.util.List;

public interface PackDetailService {
	List<PackDetailVO> selectPackDetailList(int packNo);
	PackDetailVO selectPackDetail(int packDno);
	PackVO selectPack(int packNo);
}
