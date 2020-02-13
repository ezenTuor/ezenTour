package com.ezen.tour.wishList.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;
import com.ezen.tour.wishListView.model.WishListViewVO;

public interface WishListService {
	public List<WishListViewVO> selectWishList(MemberVO memberVo);
	public int deleteWish(int wishNo);
}
