package com.ezen.tour.manager.pack.model;

import java.util.List;

import com.ezen.tour.manager.packDetail.model.ManagerDetailVO;

public interface ManagerPackDAO {
	int insertPack(ManagerPackVo packVo);
	List<ManagerPackVo> selectList();
	ManagerPackVo selectPack(int packNo);
	int updatePack(ManagerPackVo packVo);
}
