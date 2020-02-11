package com.ezen.tour.manager.area.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AreaServiceImpl implements AreaService{
	@Autowired
	private AreaDAO areaDao;

	@Override
	public List<ManagerAreaVO> selectArea() {
		return areaDao.selectArea();
	}

	@Override
	public String selectByAreaNo(int areaNo) {
		return areaDao.selectByAreaNo(areaNo);
	}
}
