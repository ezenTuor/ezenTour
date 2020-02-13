package com.ezen.tour.wishList.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.common.SearchVO;
import com.ezen.tour.member.model.MemberVO;
import com.ezen.tour.wishListView.model.WishListViewVO;

@Service
public class WishListServiceImpl implements WishListService{
	@Autowired
	private WishListDAO wishListDao;

	@Override
	public List<WishListViewVO> selectWishList(MemberVO memberVo) {
		return wishListDao.selectWishList(memberVo);
	}

	@Override
	public int deleteWish(int wishNo) {
		return wishListDao.deleteWish(wishNo);
	}
}
