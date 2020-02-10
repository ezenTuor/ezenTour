package com.ezen.tour.wishList.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.SearchVO;

@Service
public class WishListServiceImpl implements WishListService{
	@Autowired
	private WishListDAO wishListDao;

	@Override
	public List<WishListVO> selectWishList(SearchVO searchVo) {
		return wishListDao.selectWishList(searchVo);
	}

	@Override
	public WishListVO selectWish(int wishNo) {
		return wishListDao.selectWish(wishNo);
	}
}
