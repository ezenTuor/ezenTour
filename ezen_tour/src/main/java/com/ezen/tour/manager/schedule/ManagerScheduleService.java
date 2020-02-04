package com.ezen.tour.manager.schedule;

import java.util.List;

public interface ManagerScheduleService {
	int insertSchedule(List<ManagerScheduleVO> list);
	List<ManagerScheduleVO> selectByPackDno(int packDno);
	int updateSchedule(List<ManagerScheduleVO> list);
}
