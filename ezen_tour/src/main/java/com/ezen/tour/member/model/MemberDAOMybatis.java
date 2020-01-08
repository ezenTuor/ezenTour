package com.ezen.tour.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis implements MemberDAO{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace="com.mybatis.mapper.eztuor.";
	
	@Override
	public int insertMember(MemberVO vo) {
		return sqlSession.insert(namespace+"insertMember",vo);
	}

	@Override
	public MemberVO selectMember(String userid) {
		return sqlSession.selectOne(namespace+"selectMember",userid);
	}

	@Override
	public String selectPwd(String userid) {
		return sqlSession.selectOne(namespace+"selectPwd",userid);
	}
	
}
