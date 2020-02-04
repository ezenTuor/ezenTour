package com.ezen.tour.manager.packDetail.model;

public interface ManagerDetailService {
	int insertDetail(ManagerDetailVO detailVo);
	ManagerDetailVO selectDetail(int packDno);
}
