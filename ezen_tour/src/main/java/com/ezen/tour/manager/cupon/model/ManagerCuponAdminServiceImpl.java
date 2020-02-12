package com.ezen.tour.manager.cupon.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.SearchVO;

@Service
public class ManagerCuponAdminServiceImpl implements ManagerCuponAdminService{
	@Autowired
	private ManagerCuponAdminDAO managerCuponAdminDao;

	@Override
	public List<ManagerCuponAdminVO> selectAdmin(SearchVO searchVo) {
		return managerCuponAdminDao.selectAdmin(searchVo);
	}

	@Override
	public int selectAdminTotal(SearchVO searchVo) {
		return managerCuponAdminDao.selectAdminTotal(searchVo);
	}

	@Override
	public int insertAdmin(ManagerCuponAdminVO managerCuponAdminVo) {
		return managerCuponAdminDao.insertAdmin(managerCuponAdminVo);
	}

	@Override
	public int deleteAdmin(String delNums) {
		String[] sArr=delNums.split("\\|");
		
		int result=0;
		for(String delNum:sArr) {
			int cuponSerial=Integer.parseInt(delNum);
			result+=managerCuponAdminDao.deleteAdmin(cuponSerial);
		}
		return result;
	}
}
