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
	public List<HistoryViewVO> historyChoosePack(int historyNo) {
		return historyDao.historyChoosePack(historyNo);
	}

	@Override
	public List<HistoryViewVO> selectMtoM(HistorySearchVO vo) {
		return historyDao.selectMtoM(vo);
	}

	@Override
	public List<HistoryViewVO> selectAll(int userNo) {
		return historyDao.selectAll(userNo);
	}

	@Override
	public List<HistoryViewVO> reviewChoosePack() {
		return historyDao.reviewChoosePack();
	}

	@Override
	public int insertHistory(HistoryVO vo) {
		return historyDao.insertHistory(vo);
	}
	
}