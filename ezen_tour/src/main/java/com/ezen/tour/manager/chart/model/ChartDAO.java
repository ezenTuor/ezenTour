package com.ezen.tour.manager.chart.model;

import java.util.List;

public interface ChartDAO {
	List<ChartVO> selectChart(SearchChartVO searchChartVo);
}
