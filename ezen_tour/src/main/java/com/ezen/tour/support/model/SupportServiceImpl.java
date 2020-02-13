package com.ezen.tour.support.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;

@Service
public class SupportServiceImpl implements SupportService{
	@Autowired
	private SupportDAO supportDao;

	@Override
	public List<SupportViewVO> selectAll(MemberVO vo) {
		return supportDao.selectAll(vo);
	}

	@Override
	public int selectTotalRecord(MemberVO vo) {
		return supportDao.selectTotalRecord(vo);
	}

	@Override
	public int insertSupport(SupportVO vo) {
		return supportDao.insertSupport(vo);
	}

	@Override
	public SupportViewVO selectSupportByNo(int supportNo) {
		return supportDao.selectSupportByNo(supportNo);
	}

	@Override
	public int editSupport(SupportVO vo) {
		return supportDao.editSupport(vo);
	}

	@Override
	public SupportViewVO selectByNo(int supportNo) {
		return supportDao.selectByNo(supportNo);
	}

	@Override
	public List<SupportViewVO> selectAdmin(SearchVO searchVo) {
		return supportDao.selectAdmin(searchVo);
	}

	@Override
	public int selectAdminTotal(SearchVO searchVo) {
		return supportDao.selectAdminTotal(searchVo);
	}

	@Override
	public List<SupportViewVO> selectmySupport(MemberVO vo) {
		return supportDao.selectmySupport(vo);
	}

	@Override
	public List<SupportVO> selectReply(int groupNo) {
		return supportDao.selectReply(groupNo);
	}

	@Override
	public int insertAdmin(SupportVO supportVo) {
		int cnt=supportDao.insertAdmin(supportVo);
		cnt=supportDao.updateAdmin(supportVo.getGroupNo());
		return cnt;
	}

	@Override
	public SupportViewVO selectRe(int groupNo) {
		return supportDao.selectRe(groupNo);
	}
}
