package com.ezen.tour.manager.packDetail.model;

import java.util.List;

import com.ezen.tour.manager.pack.model.ManagerPackVo;

public interface ManagerDetailDAO {
	int insertDetail(ManagerDetailVO detailVo);
	ManagerDetailVO selectDetail(int packDno);
	List<ManagerDetailVO> selectDetailsByPackNo(int packNo);
	ManagerDetailViewVO selectDetailView(int packDno);
}
