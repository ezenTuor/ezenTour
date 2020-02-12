package com.ezen.tour.manager.chart.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChartServiceImpl implements ChartService{
	@Autowired
	private ChartDAO chartDao;

	@Override
	public List<ChartVO> selectChart(SearchChartVO searchChartVo) {
		return chartDao.selectChart(searchChartVo);
	}
}
