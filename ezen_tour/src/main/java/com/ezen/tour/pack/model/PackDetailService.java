package com.ezen.tour.pack.model;


import java.util.List;

public interface PackDetailService {
	List<PackDetailVO> selectPackDetailList(int packNo);
	PackDetailVO selectPackDetail(int packDno);
	PackVO selectPack(int packNo);
	MaxMinPriceVO selectMinMaxPrice(int packNo);
	List<AreaVO> areaSelect();
	List<PackVO> packSelAreaNo(int areaNo);
	List<PackVO> areaDetailSearch(String searchAreaKeyword);
	List<AreaDetailVO> selectAreaDetail(int areaNo);
	List<PackDetailVO> selectByDate(String koreaDep);
	List<String> selKWList(int tagNo);
	List<PackVO> selectPackByKw(String keyword);
	String areaKeyword(int tagNo);

}
