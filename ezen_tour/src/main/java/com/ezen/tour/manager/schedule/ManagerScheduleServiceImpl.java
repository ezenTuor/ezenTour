package com.ezen.tour.manager.schedule;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerScheduleServiceImpl implements ManagerScheduleService{
	@Autowired
	private ManagerScheduleDAO managerScheduleDao;

	@Override
	public int insertSchedule(List<ManagerScheduleVO> list) {
		int cnt=1;
		for(ManagerScheduleVO scheduleVo:list) {
			cnt*=managerScheduleDao.insertSchedule(scheduleVo);
		}
		return cnt;
	}
}
