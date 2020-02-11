package com.ezen.tour.wishListView.model;

import java.util.List;

public interface WishListViewService {
	List<WishListViewVO> selectWishListView(int userNo);
	WishListViewVO selectWish(int wishNo);
}
