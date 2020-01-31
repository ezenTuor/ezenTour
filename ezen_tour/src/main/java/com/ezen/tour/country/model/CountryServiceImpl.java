package com.ezen.tour.country.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CountryServiceImpl implements CountryService{
	@Autowired
	private CountryDAO countryDao;

	@Override
	public List<CountryVO> selectAll() {
		return countryDao.selectAll();
	}
}
