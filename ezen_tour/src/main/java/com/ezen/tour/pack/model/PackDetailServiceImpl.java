package com.ezen.tour.pack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PackDetailServiceImpl implements PackDetailService {

	@Autowired
	private PackDetailDAO packDetailDao;
	
	@Override
	public List<PackDetailVO> selectPackDetailList(int packNo) {
		
		return packDetailDao.selectPackDetailList(packNo);
	}

	@Override
	public PackDetailVO selectPackDetail(int packDno) {

		return packDetailDao.selectPackDetail(packDno);
	}

	@Override
	public PackVO selectPack(int packNo) {
		return packDetailDao.selectPack(packNo);
	}

	@Override
	public MaxMinPriceVO selectMinMaxPrice(int packNo) {
		return packDetailDao.selectMinMaxPrice(packNo);
	}

	@Override
	public List<AreaVO> areaSelect() {
		return packDetailDao.areaSelect();
	}
	
	
}
