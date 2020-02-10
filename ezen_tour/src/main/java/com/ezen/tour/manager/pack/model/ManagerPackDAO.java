package com.ezen.tour.manager.pack.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.manager.packDetail.model.ManagerDetailVO;

public interface ManagerPackDAO {
	int insertPack(ManagerPackVo packVo);
	ManagerPackVo selectPack(int packNo);
	int updatePack(ManagerPackVo packVo);
	List<ManagerPackViewVO> selectList(SearchVO searchVo);
	int selectTotal(SearchVO searchVo);
}
