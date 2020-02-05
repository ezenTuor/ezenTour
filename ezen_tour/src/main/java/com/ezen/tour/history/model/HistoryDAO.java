package com.ezen.tour.history.model;

import java.util.List;

public interface HistoryDAO {
	public List<HistoryViewVO> selectAll();
	public int reviewUpdate(HistoryVO historyVo);
	
}