package com.ezen.tour.member.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOMybatis implements MemberDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String namespace="config.mybatis.mapper.oracle.member.";
	
	@Override
	public int insertMember(MemberVO vo) {
		return sqlSession.insert(namespace+"insertMember",vo);
	}

	@Override
	public MemberVO selectMember(String userId) {
		return sqlSession.selectOne(namespace+"selectMember",userId);
	}

	@Override
	public String selectPwd(String userId) {
		return sqlSession.selectOne(namespace+"selectPwd",userId);
	}

	@Override
	public int selectDuplicate(String userId) {
		return sqlSession.selectOne(namespace+"selectDup",userId);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		return sqlSession.update(namespace+"memberUpdate",vo);
	}

	@Override
	public int deleteMember(String userId) {
		return sqlSession.update(namespace+"deleteMember",userId);
	}

	@Override
	public int selectUserNo(String userId) {
		return sqlSession.selectOne(namespace+"selectUser_no",userId);
	}

	@Override
	public String FindUserIdByEmail(Map<String, String> map) {
		return sqlSession.selectOne(namespace+"FindUserIdByEmail",map);
	}

	@Override
	public String FindPwd(Map<String, String> map) {
		return sqlSession.selectOne(namespace+"FindPwd",map);
	}

	@Override
	public int updateUserPwd(MemberVO vo) {
		return sqlSession.update(namespace+"updateUser_Pwd",vo);
	}
}
