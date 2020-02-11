package com.ezen.tour.member.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.SearchVO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDao;

	@Override
	public int insertMember(MemberVO vo) {
		return memberDao.insertMember(vo);
	}

	@Override
	public MemberVO selectMember(String userId) {
		return memberDao.selectMember(userId);
	}

	@Override
	public int loginCheck(String userId, String userPwd) {
		String dbPwd = memberDao.selectPwd(userId);
		
		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=NONE_USERID;  //해당 아이디가 없다
		}else {
			if(dbPwd.equals(userPwd)) {
				result=LOGIN_OK;  //로그인 성공
			}else {
				result=DISAGREE_PWD; //비밀번호 불일치
			}
		}
		
		return result;
	}
	@Override
	public int selectDuplicate(String userId) {
		int result=0;
		
		int count = memberDao.selectDuplicate(userId);
		
		if(count>0) {
			result=EXIST_ID; //해당 아이디 이미 존재
		}else {
			result=USEFUL_ID; //사용가능
		}
		
		return result;

	}

	@Override
	public int memberUpdate(MemberVO vo) {
		return memberDao.memberUpdate(vo);
	}

	@Override
	public int deleteMember(String userId) {
		return memberDao.deleteMember(userId);
	}

	@Override
	public int selectUserNo(String userId) {
		return memberDao.selectUserNo(userId);
	}

	@Override
	public String FindUserIdByEmail(Map<String, String> map) {
		return memberDao.FindUserIdByEmail(map);
	}

	@Override
	public String FindPwd(Map<String, String> map) {
		return memberDao.FindPwd(map);
	}

	@Override
	public int updateUserPwd(MemberVO vo) {
		return memberDao.updateUserPwd(vo);
	}

	@Override
	public String findUserIdByUserNo(int userNo) {
		return memberDao.findUserIdByUserNo(userNo);
	}

	@Override
	public List<MemberVO> selectAll(SearchVO searchVo) {
		return memberDao.selectAll(searchVo);
	}

	@Override
	public int selectTotal(SearchVO searchVo) {
		return memberDao.selectTotal(searchVo);
	}
}
