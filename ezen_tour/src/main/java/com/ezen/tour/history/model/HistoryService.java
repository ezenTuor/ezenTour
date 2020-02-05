package com.ezen.tour.history.model;

import java.util.List;

public interface HistoryService {
	public List<HistoryViewVO> selectAll();
	public int reviewUpdate(HistoryVO historyVo);

}