package com.ezen.tour.wishList.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;

public interface WishListDAO {
	public List<WishListVO> selectWishList(MemberVO memberVo);
	public int deleteWish(int wishNo);
}
