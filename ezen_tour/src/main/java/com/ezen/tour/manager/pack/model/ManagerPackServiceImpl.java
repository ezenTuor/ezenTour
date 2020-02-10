package com.ezen.tour.manager.pack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.manager.packDetail.model.ManagerDetailVO;

@Service
public class ManagerPackServiceImpl implements ManagerPackService{
	@Autowired
	private ManagerPackDAO managerPackDao;
	
	@Override
	public int insertPack(ManagerPackVo packVo) {
		return managerPackDao.insertPack(packVo);
	}

	@Override
	public List<ManagerPackVo> selectList() {
		return managerPackDao.selectList();
	}

	@Override
	public ManagerPackVo selectPack(int packNo) {
		return managerPackDao.selectPack(packNo);
	}

	@Override
	public int updatePack(ManagerPackVo packVo) {
		return managerPackDao.updatePack(packVo);
	}

	@Override
	public List<ManagerPackViewVO> selectList2(SearchVO searchVo) {
		return managerPackDao.selectList2(searchVo);
	}

	@Override
	public List<ManagerPackViewVO> selectList3() {
		return managerPackDao.selectList3();
	}
}
