package com.ezen.tour.manager.pack.model;

import java.util.List;

import com.ezen.tour.manager.packDetail.model.ManagerPackDetailVO;

public interface ManagerPackService {
	int insertPack(ManagerPackVo packVo);
	List<ManagerPackVo> selectList();
	ManagerPackVo selectPack(int packNo);
	int updatePack(ManagerPackVo packVo);
	int insertDetail(ManagerPackDetailVO detailVo);
	ManagerPackDetailVO selectdetail(int packDno);
}
