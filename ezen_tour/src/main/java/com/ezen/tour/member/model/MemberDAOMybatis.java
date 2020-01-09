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
	public MemberVO selectMember(String user_id) {
		return sqlSession.selectOne(namespace+"selectMember",user_id);
	}

	@Override
	public String selectPwd(String user_id) {
		return sqlSession.selectOne(namespace+"selectPwd",user_id);
	}

	@Override
	public int selectDuplicate(String user_id) {
		return sqlSession.selectOne(namespace+"selectDuplicate",user_id);
	}
}
