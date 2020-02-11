package com.ezen.tour.mileage.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;

public interface MileageDAO {
	List<MileageVO> selectAll(MemberVO memberVo);
	int selectTotalRecord(int userNo);
}
