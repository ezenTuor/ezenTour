package com.ezen.tour.history.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.HistorySearchVO;

@Service
public class HistoryServiceImpl implements HistoryService{

	@Autowired
	private HistoryDAO historyDao;

	@Override
	public List<HistoryViewVO> selectHistory(int userNo) {
		return historyDao.selectHistory(userNo);
	}

	@Override
	public int reviewUpdate(int historyNo) {
		return historyDao.reviewUpdate(historyNo);
	}

	@Override
	public List<HistoryViewVO> choosePack() {
		return historyDao.choosePack();
	}

	@Override
	public List<HistoryViewVO> selectMtoM(HistorySearchVO vo) {
		return historyDao.selectMtoM(vo);
	}

	@Override
	public List<HistoryViewVO> selectAll(int userNo) {
		return historyDao.selectAll(userNo);
	}
	
}