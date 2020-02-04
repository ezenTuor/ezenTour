package com.ezen.tour.manager.packDetail.model;

public interface ManagerDetailDAO {
	int insertDetail(ManagerDetailVO detailVo);
	ManagerDetailVO selectDetail(int packDno);
}
