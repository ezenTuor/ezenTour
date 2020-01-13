package com.ezen.tour.pack.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PackDetailDAOMybatis implements PackDetailDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.mybatis.mapper.pack.";
	
	@Override
	public List<PackVO> selectPackDetailList(int packNo){
		return sqlSession.selectList(namespace+"selectPackDetailList", packNo);
	} //이건 디테일 리스트에 이용
	
	@Override
	public PackDetailVO selectPackDetail(int packDno) {
		return sqlSession.selectOne(namespace+"selectPackDetail", packDno);
	} //디테일 정보
	
	@Override
	public PackVO selectPack(int packNo) {
		return sqlSession.selectOne(namespace+"selectPack", packNo);
	}

}
