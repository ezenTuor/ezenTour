package com.ezen.tour.payment.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentServiceImpl implements PaymentService{
	@Autowired
	private PaymentDAO paymentDao;

}
