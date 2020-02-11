package com.ezen.tour.wishList.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.tour.common.SearchVO;

@Repository
public class WishListDAOMybatis implements WishListDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.wishList.";

	@Override
	public List<WishListVO> selectWishList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectWishList",searchVo);
	}

	@Override
	public int deleteWish(int wishNo) {
		return sqlSession.delete(namespace+"deleteWish", wishNo);
	}
}
