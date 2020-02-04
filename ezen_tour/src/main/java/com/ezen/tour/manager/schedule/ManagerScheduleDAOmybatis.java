package com.ezen.tour.manager.schedule;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerScheduleDAOmybatis implements ManagerScheduleDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.managerSchedule.";

	@Override
	public int insertSchedule(ManagerScheduleVO scheduleVo) {
		return sqlSession.insert(namespace+"insertSchedule", scheduleVo);
	}

	@Override
	public List<ManagerScheduleVO> selectByPackDno(int packDno) {
		return sqlSession.selectList(namespace+"selectByPackDno", packDno);
	}

	@Override
	public int updateSchedule(ManagerScheduleVO scheduleVo) {
		return sqlSession.update(namespace+"updateSchedule", scheduleVo);
	}
}
