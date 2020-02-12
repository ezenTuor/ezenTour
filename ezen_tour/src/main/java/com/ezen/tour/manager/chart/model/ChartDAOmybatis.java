package com.ezen.tour.manager.chart.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChartDAOmybatis implements ChartDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace="config.mybatis.mapper.oracle.chart.";

	@Override
	public List<ChartVO> selectChart(SearchChartVO searchChartVo) {
		return sqlSession.selectList(namespace+"selectChart", searchChartVo);
	}
	
}
