package com.ezen.tour.manager.chart.model;

import java.util.List;

public interface ChartService {
	List<ChartVO> selectChart(SearchChartVO searchChartVo);
}
