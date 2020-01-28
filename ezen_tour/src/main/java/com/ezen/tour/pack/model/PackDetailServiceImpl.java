package com.ezen.tour.pack.model;

import java.sql.Timestamp;
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

	@Override
	public List<PackVO> packSelAreaNo(int areaNo) {
		return packDetailDao.packSelAreaNo(areaNo);
	}

	@Override
	public List<PackVO> areaDetailSearch(String searchAreaKeyword) {
		return packDetailDao.areaDetailSearch(searchAreaKeyword);
	}

	@Override
	public List<AreaDetailVO> selectAreaDetail(int areaNo) {
		return packDetailDao.selectAreaDetail(areaNo);
	}

	@Override
	public List<PackDetailVO> selectByDate(String koreaDep) {
		return packDetailDao.selectByDate(koreaDep);
	}

	@Override
	public List<String> selKWList(int tagNo) {
		return packDetailDao.selKWList(tagNo);
	}

	@Override
	public List<PackVO> selectPackByKw(String keyword) {
		return packDetailDao.selectPackByKw(keyword);
	}

	@Override
	public String areaKeyword(int tagNo) {
		return packDetailDao.areaKeyword(tagNo);
	}

	
	
}
