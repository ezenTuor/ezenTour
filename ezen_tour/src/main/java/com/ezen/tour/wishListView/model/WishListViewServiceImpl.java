package com.ezen.tour.wishListView.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class WishListViewServiceImpl implements WishListViewService{
	@Autowired
	private WishListViewDAO wishListViewDao;

	@Override
	public List<WishListViewVO> selectWishListView(int userNo) {
		return wishListViewDao.selectWishListView(userNo);
	}

	
}
