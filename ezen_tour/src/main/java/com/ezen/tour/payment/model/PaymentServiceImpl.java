package com.ezen.tour.payment.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.tour.payment.model.PaymentVO;

@Service
public class PaymentServiceImpl implements PaymentService{
	
	@Autowired
	private PaymentDAO paymentDao;

	@Override
	public int insertPayment(PaymentVO vo) {
		int cnt=paymentDao.insertPayment(vo);
		return cnt;
	}

	@Override
	public List<PaymentVO> selectAll(int userNo) {
		return paymentDao.selectAll(userNo);
	}

	@Override
	public PaymentVO selectByNo(int paymentNo) {
		return paymentDao.selectByNo(paymentNo);
	}
}
