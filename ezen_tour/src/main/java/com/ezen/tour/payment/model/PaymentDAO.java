package com.ezen.tour.payment.model;

import java.util.List;

import com.ezen.tour.member.model.MemberVO;

public interface PaymentDAO {
	public int insertPayment(PaymentVO vo);
	List<PaymentVO> selectAll(MemberVO memberVo);
	PaymentVO selectByNo(int paymentNo);
}
