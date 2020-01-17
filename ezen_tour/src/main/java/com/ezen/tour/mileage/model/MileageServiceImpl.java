package com.ezen.tour.mileage.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MileageServiceImpl implements MileageService{
	@Autowired
	private MileageDAO mileageDao;
}
