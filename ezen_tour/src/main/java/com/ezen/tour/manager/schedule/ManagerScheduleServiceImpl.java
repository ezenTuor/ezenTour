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

	@Override
	public List<ManagerScheduleVO> selectByPackDno(int packDno) {
		return managerScheduleDao.selectByPackDno(packDno);
	}

	@Override
	public int updateSchedule(List<ManagerScheduleVO> list) {
		int cnt=1;
		for(ManagerScheduleVO scheduleVo:list) {
			cnt*=managerScheduleDao.updateSchedule(scheduleVo);
		}
		return cnt;
	}
}
