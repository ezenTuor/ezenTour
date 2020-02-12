package com.ezen.tour.pack.model;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.manager.schedule.ManagerScheduleVO;
import com.ezen.tour.wishList.model.WishListVO;

@Repository
public class PackDetailDAOMybatis implements PackDetailDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "com.mybatis.mapper.pack.";
	
	@Override
	public List<PackDetailVO> selectPackDetailList(int packNo){
		return sqlSession.selectList(namespace+"selectPackDetailList", packNo);
	} //�̰� ������ ����Ʈ�� �̿�
	
	@Override
	public PackDetailVO selectPackDetail(int packDno) {
		return sqlSession.selectOne(namespace+"selectPackDetail", packDno);
	} //������ ����
	
	@Override
	public PackVO selectPack(int packNo) {
		return sqlSession.selectOne(namespace+"selectPack", packNo);
	}
	
	@Override
	public MaxMinPriceVO selectMinMaxPrice(int packNo) {
		return sqlSession.selectOne(namespace+"selectMinMaxPrice", packNo);
	}
	
	@Override
	public List<AreaVO> areaSelect() {
		return sqlSession.selectList(namespace+"areaSelect");
	} //��з� �׺��
	
	@Override
	public List<PackVO> packSelAreaNo(int areaNo) {
		return sqlSession.selectList(namespace+"packSelAreaNo", areaNo);
	}
	
	@Override
	public List<PackVO> areaDetailSearch(String searchAreaKeyword){
		return sqlSession.selectList(namespace+"searchAreaKeyword", searchAreaKeyword);
	}
	
	@Override
	public List<AreaDetailVO> selectAreaDetail(int areaNo){
		return sqlSession.selectList(namespace+"selectAreaDetail", areaNo);
	}
	
	@Override
	public List<PackDetailViewVO> selectByDate(PackAjaxVO packAjaxVo){		
		 return sqlSession.selectList(namespace+"selectByDate", packAjaxVo);
	}
	
	@Override
	public List<String> selKWList(int tagNo){
		return sqlSession.selectList(namespace+"packDetailListSelect", tagNo);
	}
	
	@Override
	public List<PackVO> selectPackByKw(String keyword){
		return sqlSession.selectList(namespace+"selectPackByKw", keyword);
	}
	
	@Override
	public List<PackTwoVO> selectPackByKw2(String keyword){
		return sqlSession.selectList(namespace+"selectPackByKw2", keyword);
	}
	
	@Override
	public String areaKeyword(int tagNo) {
		return sqlSession.selectOne(namespace+"areaKeyword", tagNo);
	}
	
	@Override
	public int insertWish(WishListVO vo) {
		int cnt = sqlSession.insert(namespace+"insertWish", vo);
		return cnt;
	}
	
	@Override
	public List<String> selDate(int packNo) {
		return sqlSession.selectList(namespace+"selDate", packNo);
	}
	
	@Override
	public int updateCapaCur(PackDetailVO packDetailVo) {
		int cnt = sqlSession.update(namespace+"updateCapaCur", packDetailVo);
		return cnt;
	}
	
	@Override
	public int scoreAvg(int packDno) {
		return sqlSession.selectOne(namespace+"scoreAvg", packDno);
	}
	
	@Override
	public List<ManagerScheduleVO> selectSch(int packDno) {
		return sqlSession.selectList(namespace+"selectSch", packDno);
	}

}
