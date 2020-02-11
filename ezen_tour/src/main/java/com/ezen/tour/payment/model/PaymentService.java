package com.ezen.tour.payment.model;

import java.util.List;

import com.ezen.tour.payment.model.PaymentVO;

public interface PaymentService {
	public int insertPayment(PaymentVO vo);
	List<PaymentVO> selectAll(int userNo);
	PaymentVO selectByNo(int paymentNo);
}
