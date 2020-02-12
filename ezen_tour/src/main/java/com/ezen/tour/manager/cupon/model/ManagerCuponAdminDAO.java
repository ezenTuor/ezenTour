package com.ezen.tour.manager.cupon.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;

public interface ManagerCuponAdminDAO {
	List<ManagerCuponAdminVO> selectAdmin(SearchVO searchVo);
	int selectAdminTotal(SearchVO searchVo);
	int insertAdmin(ManagerCuponAdminVO managerCuponAdminVo);
	int deleteAdmin(int cuponSerial);
}
