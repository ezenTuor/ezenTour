package com.ezen.tour.manager.packDetail.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerDetailServiceImpl implements ManagerDetailService{
	@Autowired
	private ManagerDetailDAO managerDetailDao;

	@Override
	public int insertDetail(ManagerDetailVO detailVo) {
		return managerDetailDao.insertDetail(detailVo);
	}

	@Override
	public ManagerDetailVO selectDetail(int packDno) {
		return managerDetailDao.selectDetail(packDno);
	}

	@Override
	public List<ManagerDetailVO> selectDetailsByPackNo(int packNo) {
		return managerDetailDao.selectDetailsByPackNo(packNo);
	}
}
