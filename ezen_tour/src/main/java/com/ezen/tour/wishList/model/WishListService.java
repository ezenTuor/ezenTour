package com.ezen.tour.wishList.model;

import java.util.List;

import com.ezen.tour.common.SearchVO;

public interface WishListService {
	public List<WishListVO> selectWishList(SearchVO searchVo);
	public int deleteWish(int wishNo);
}
