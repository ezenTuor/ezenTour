package com.ezen.tour.history.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HistoryServiceImpl implements HistoryService{

	@Autowired
	private HistoryDAO historyDao;

	@Override
	public List<HistoryViewVO> selectAll() {
		return historyDao.selectAll();
	}

	@Override
	public int reviewUpdate(HistoryVO historyVo) {
		return historyDao.reviewUpdate(historyVo);
	}
	
}