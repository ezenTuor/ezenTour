package com.ezen.tour.manager.areadetail.model;

import java.util.List;

public interface AreaDetailDAO {
	List<ManagerAreaDetailVO> selectAreaDetail(int areaNo);
}
