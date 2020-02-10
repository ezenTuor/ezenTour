package com.ezen.tour.wishListView.model;

import java.util.List;

public interface WishListViewDAO {
	List<WishListViewVO> selectWishListView(int userNo);
	WishListViewVO selectWish(int wishNo);
}
