package com.ezen.tour.pack.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PackDetailServiceImpl implements PackDetailService {

	@Autowired
	private PackDetailDAO packDetailDao;
	
	@Override
	public List<PackDetailVO> selectPackDetailList(String packNo) {
		
		return packDetailDao.selectPackDetailList(packNo);
	}

}
