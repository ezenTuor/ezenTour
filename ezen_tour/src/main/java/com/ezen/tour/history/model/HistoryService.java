package com.ezen.tour.history.model;

import java.util.List;

public interface HistoryService {
	public List<HistoryViewVO> selectAll(int userNo);
	public int reviewUpdate(int historyNo);
	public List<HistoryViewVO> choosePack();

}