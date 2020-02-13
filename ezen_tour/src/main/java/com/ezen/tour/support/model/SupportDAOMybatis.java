package com.ezen.tour.support.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;

@Repository
public class SupportDAOMybatis implements SupportDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.support.";
	
	@Override
	public List<SupportViewVO> selectAll(MemberVO vo) {
		return sqlSession.selectList(namespace+"selectAll",vo);
	}

	@Override
	public int selectTotalRecord(MemberVO vo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord",vo);
	}

	@Override
	public int insertSupport(SupportVO vo) {
		return sqlSession.insert(namespace+"insertSupport",vo);
	}

	@Override
	public SupportViewVO selectSupportByNo(int supportNo) {
		return sqlSession.selectOne(namespace+"selectSupportByNo",supportNo);
	}

	@Override
	public int editSupport(SupportVO vo) {
		return sqlSession.update(namespace+"editSupport",vo);
	}

	@Override
	public SupportViewVO selectByNo(int supportNo) {
		return sqlSession.selectOne(namespace+"selectByNo",supportNo);
	}

	@Override
	public List<SupportViewVO> selectAdmin(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectAdmin", searchVo);
	}

	@Override
	public int selectAdminTotal(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectAdminTotal", searchVo);
	}

	@Override
	public List<SupportViewVO> selectmySupport(MemberVO vo) {
		return sqlSession.selectList(namespace+"selectmySupport",vo);
	}

	@Override
	public List<SupportVO> selectReply(int groupNo) {
		return sqlSession.selectList(namespace+"selectReply",groupNo);
	}

	@Override
	public int insertAdmin(SupportVO supportVo) {
		return sqlSession.insert(namespace+"insertAdmin", supportVo);
	}

	@Override
	public int updateAdmin(int supportNo) {
		return sqlSession.update(namespace+"updateAdmin", supportNo);
	}

	@Override
	public SupportViewVO selectRe(int groupNo) {
		return sqlSession.selectOne(namespace+"selectRe", groupNo);
	}
}
