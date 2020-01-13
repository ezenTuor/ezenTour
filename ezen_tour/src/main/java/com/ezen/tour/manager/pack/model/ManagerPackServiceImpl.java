package com.ezen.tour.manager.pack.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.pack.model.PackVO;

@Service
public class ManagerPackServiceImpl implements ManagerPackService{
	@Autowired
	private ManagerPackDAO managerPackDao;
	
	@Override
	public int insertPack(ManagerPackVo packVo) {
		return managerPackDao.insertPack(packVo);
	}
}
