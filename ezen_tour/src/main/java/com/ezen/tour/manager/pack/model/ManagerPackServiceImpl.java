package com.ezen.tour.manager.pack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.SearchVO;

@Service
public class ManagerPackServiceImpl implements ManagerPackService{
	@Autowired
	private ManagerPackDAO managerPackDao;
	
	@Override
	public int insertPack(ManagerPackVo packVo) {
		return managerPackDao.insertPack(packVo);
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
	public List<ManagerPackViewVO> selectList(SearchVO searchVo) {
		return managerPackDao.selectList(searchVo);
	}

	@Override
	public int selectTotal(SearchVO searchVo) {
		return managerPackDao.selectTotal(searchVo);
	}
}
