package com.ezen.tour.manager.schedule;

import java.util.List;

public interface ManagerScheduleDAO {
	int insertSchedule(ManagerScheduleVO scheduleVo);
	List<ManagerScheduleVO> selectByPackDno(int packDno);
	int updateSchedule(ManagerScheduleVO scheduleVo);
}
