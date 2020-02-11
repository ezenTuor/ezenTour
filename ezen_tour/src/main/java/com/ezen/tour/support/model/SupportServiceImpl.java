package com.ezen.tour.support.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.member.model.MemberVO;

@Service
public class SupportServiceImpl implements SupportService{
	@Autowired
	private SupportDAO supportDao;

	@Override
	public List<SupportVO> selectAll(MemberVO vo) {
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
	public SupportVO selectSupportByNo(int supportNo) {
		return supportDao.selectSupportByNo(supportNo);
	}

	@Override
	public int editSupport(SupportVO vo) {
		return supportDao.editSupport(vo);
	}

	@Override
	public SupportVO selectByNo(int supportNo) {
		return supportDao.selectByNo(supportNo);
	}

	@Override
	public int supportReply(SupportVO vo) {
		return supportDao.supportReply(vo);
	}

	@Override
	public SupportVO selectReply(int groupNo) {
		return supportDao.selectReply(groupNo);
	}
}
