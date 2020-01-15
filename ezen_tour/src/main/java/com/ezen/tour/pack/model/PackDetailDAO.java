package com.ezen.tour.pack.model;

import java.util.List;

public interface PackDetailDAO {

	List<PackDetailVO> selectPackDetailList(int packNo);

	PackDetailVO selectPackDetail(int packDno);

	PackVO selectPack(int packNo);

	int selectMinPrice(int packNo);

	int selectMaxPrice(int packNo);

}
