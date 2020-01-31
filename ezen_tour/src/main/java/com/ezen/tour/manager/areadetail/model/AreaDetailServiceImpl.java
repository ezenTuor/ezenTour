package com.ezen.tour.manager.areadetail.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AreaDetailServiceImpl implements AreaDetailService{
	@Autowired
	private AreaDetailDAO areaDetailDao;

	@Override
	public List<ManagerAreaDetailVO> selectAreaDetail(int areaNo) {
		return areaDetailDao.selectAreaDetail(areaNo);
	}
}
