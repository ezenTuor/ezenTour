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
	public List<SupportVO> selectAll(MemberVO vo) {
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
	public SupportVO selectSupportByNo(int supportNo) {
		return sqlSession.selectOne(namespace+"selectSupportByNo",supportNo);
	}

	@Override
	public int editSupport(SupportVO vo) {
		return sqlSession.update(namespace+"editSupport",vo);
	}

	@Override
	public SupportVO selectByNo(int supportNo) {
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
	public List<SupportVO> selectmySupport(MemberVO vo) {
		return sqlSession.selectList(namespace+"selectmySupport",vo);
	}
}
