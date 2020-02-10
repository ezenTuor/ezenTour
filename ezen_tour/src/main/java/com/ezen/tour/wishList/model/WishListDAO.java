package com.ezen.tour.wishList.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;

public interface WishListDAO {
	public List<WishListVO> selectWishList(SearchVO searchVo);
	public WishListVO selectWish(int wishNo);
}
