package com.ezen.tour.member.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberDAO memberDao;

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
		int result=0;
		
		int count = memberDao.selectDuplicate(user_id);
		
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
	public int deleteMember(String user_id) {
		return memberDao.deleteMember(user_id);
	}

	@Override
	public int selectUser_no(String user_id) {
		return memberDao.selectUser_no(user_id);
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
	public int updateUser_Pwd(Map<String, String> map) {
		return memberDao.updateUser_Pwd(map);
	}
}
