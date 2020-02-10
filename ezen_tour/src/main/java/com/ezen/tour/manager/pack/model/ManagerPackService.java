package com.ezen.tour.manager.pack.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.manager.packDetail.model.ManagerDetailVO;

public interface ManagerPackService {
	int insertPack(ManagerPackVo packVo);
	List<ManagerPackVo> selectList();
	ManagerPackVo selectPack(int packNo);
	int updatePack(ManagerPackVo packVo);
	List<ManagerPackViewVO> selectList2(SearchVO searchVo);
	List<ManagerPackViewVO> selectList3();
}
