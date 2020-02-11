package com.ezen.tour.payment.model;

import java.util.List;

public interface PaymentDAO {
	public int insertPayment(PaymentVO vo);
	List<PaymentVO> selectAll(int userNo);
	PaymentVO selectByNo(int paymentNo);
}
