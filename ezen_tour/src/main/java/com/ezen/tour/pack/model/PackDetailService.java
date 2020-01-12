package com.ezen.tour.pack.model;

import java.util.List;

public interface PackDetailService {
	List<PackDetailVO> selectPackDetailList(String packNo);
}
