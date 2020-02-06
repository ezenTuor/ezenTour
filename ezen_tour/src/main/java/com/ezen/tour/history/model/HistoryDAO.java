package com.ezen.tour.history.model;

import java.util.List;

public interface HistoryDAO {
	public List<HistoryViewVO> selectAll(int userNo);
	public int reviewUpdate(int historyNo);
	public List<HistoryViewVO> choosePack();
	
}