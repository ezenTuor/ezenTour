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
	public int memberUpdate(MemberVO vo) {
		return sqlSession.update(namespace+"memberUpdate",vo);
	}

	@Override
	public int deleteMember(String user_id) {
		return sqlSession.update(namespace+"deleteMember",user_id);
	}

	@Override
	public int selectUser_no(String user_id) {
		return sqlSession.selectOne(namespace+"selectUser_no",user_id);
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
	public int updateUser_Pwd(Map<String, String> map) {
		return sqlSession.update(namespace+"updateUser_Pwd",map);
	}
}
