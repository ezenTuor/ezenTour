package com.ezen.tour.manager.cupon.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.common.SearchVO;

@Repository
public class ManagerCuponAdminDAOmybatis implements ManagerCuponAdminDAO{
	private String namespace="config.mybatis.mapper.oracle.managerCoupon.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<ManagerCuponAdminVO> selectAdmin(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAdmin", searchVo);
	}

	@Override
	public int selectAdminTotal(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectAdminTotal", searchVo);
	}

	@Override
	public int insertAdmin(ManagerCuponAdminVO managerCuponAdminVo) {
		return sqlSession.insert(namespace+"insertAdmin", managerCuponAdminVo);
	}

	@Override
	public int deleteAdmin(int cuponSerial) {
		return sqlSession.update(namespace+"deleteAdmin", cuponSerial);
	}
}
