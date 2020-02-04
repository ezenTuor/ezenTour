package com.ezen.tour.manager.packDetail.model;

import java.util.List;

public interface ManagerDetailService {
	int insertDetail(ManagerDetailVO detailVo);
	ManagerDetailVO selectDetail(int packDno);
	List<ManagerDetailVO> selectDetailsByPackNo(int packNo);
}
