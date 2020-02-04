package com.ezen.tour.mileage.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.SearchVO;

@Service
public class MileageServiceImpl implements MileageService{
	@Autowired
	private MileageDAO mileageDao;
	@Override
	public List<MileageVO> selectAll(SearchVO searchVo) {
		return mileageDao.selectAll(searchVo);
	}

	@Override
	public int selectTotalRecord(int userNo) {
		return mileageDao.selectTotalRecord(userNo);
	}
}
