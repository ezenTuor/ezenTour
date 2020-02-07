package com.ezen.tour.wishListView.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WishListViewDAOMybatis implements WishListViewDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.wishListView.";

	@Override
	public List<WishListViewVO> selectWishListView(int userNo) {
		return sqlSession.selectList(namespace+"selectWishListView", userNo);
	}

}
