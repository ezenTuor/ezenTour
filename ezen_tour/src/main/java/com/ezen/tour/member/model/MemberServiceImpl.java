package com.ezen.tour.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDAO memberDao;

	@Override
	public int insertMember(MemberVO vo) {
		return memberDao.insertMember(vo);
	}

	@Override
	public MemberVO selectMember(String user_id) {
		return memberDao.selectMember(user_id);
	}

	@Override
	public int loginCheck(String user_id, String user_pwd) {
		String dbPwd = memberDao.selectPwd(user_id);
		
		int result=0;
		if(dbPwd==null || dbPwd.isEmpty()) {
			result=NONE_USERID;  //해당 아이디가 없다
		}else {
			if(dbPwd.equals(user_pwd)) {
				result=LOGIN_OK;  //로그인 성공
			}else {
				result=DISAGREE_PWD; //비밀번호 불일치
			}
		}
		
		return result;
	}
	@Override
	public int selectDuplicate(String user_id) {
		return memberDao.selectDuplicate(user_id);
	}
}
