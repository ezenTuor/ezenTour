package com.ezen.tour.pack.model;

import java.util.List;

import com.ezen.tour.manager.schedule.ManagerScheduleVO;
import com.ezen.tour.wishList.model.WishListVO;

public interface PackDetailDAO {

	List<PackDetailVO> selectPackDetailList(int packNo);

	PackDetailVO selectPackDetail(int packDno);

	PackVO selectPack(int packNo);

	MaxMinPriceVO selectMinMaxPrice(int packNo);

	List<AreaVO> areaSelect();

	List<PackVO> packSelAreaNo(int areaNo);

	List<PackVO> areaDetailSearch(String searchAreaKeyword);

	List<AreaDetailVO> selectAreaDetail(int areaNo);

	List<PackDetailViewVO> selectByDate(PackAjaxVO packAjaxVo);

	List<String> selKWList(int tagNo);

	List<PackVO> selectPackByKw(String keyword);

	String areaKeyword(int tagNo);

	List<PackTwoVO> selectPackByKw2(String keyword);

	int insertWish(WishListVO vo);

	List<String> selDate(int packNo);

	int updateCapaCur(PackDetailVO packDetailVo);

	int scoreAvg(int packDno);

	List<ManagerScheduleVO> selectSch(int packDno);


}
