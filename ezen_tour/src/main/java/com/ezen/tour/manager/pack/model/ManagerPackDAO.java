package com.ezen.tour.manager.pack.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;

public interface ManagerPackDAO {
	int insertPack(ManagerPackVo packVo);
	ManagerPackVo selectPack(int packNo);
	int updatePack(ManagerPackVo packVo);
	List<ManagerPackViewVO> selectList(SearchVO searchVo);
	int selectTotal(SearchVO searchVo);
}
