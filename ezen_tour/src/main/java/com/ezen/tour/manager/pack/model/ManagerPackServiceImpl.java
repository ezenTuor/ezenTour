package com.ezen.tour.manager.pack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
