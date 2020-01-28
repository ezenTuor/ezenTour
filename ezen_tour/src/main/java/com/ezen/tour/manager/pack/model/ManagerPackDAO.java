package com.ezen.tour.manager.pack.model;

import java.util.List;

public interface ManagerPackDAO {
	int insertPack(ManagerPackVo packVo);
	List<ManagerPackVo> selectList();
}
