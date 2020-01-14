package com.ezen.tour.member.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis implements MemberDAO{
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String namespace="config.mybatis.mapper.oracle.ezentour.";
	
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
		return sqlSession.selectOne(namespace+"selectDup",user_id);
	}

	@Override
	public int editMember(MemberVO vo) {
		return sqlSession.update(namespace+"editMember",vo);
	}
}
