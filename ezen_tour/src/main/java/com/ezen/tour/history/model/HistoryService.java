package com.ezen.tour.history.model;

import java.util.List;

import com.ezen.tour.common.HistorySearchVO;

public interface HistoryService {
	public List<HistoryViewVO> selectHistory(int userNo);
	public int reviewUpdate(int historyNo);
	public List<HistoryViewVO> historyChoosePack(int historyNo);
	public List<HistoryViewVO> selectMtoM(HistorySearchVO vo);
	public List<HistoryViewVO> selectAll(int userNo);
	public List<HistoryViewVO> reviewChoosePack();
	public int insertHistory(HistoryVO vo);

}