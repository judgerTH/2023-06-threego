package com.threego.app.payment.model.service;

import static com.threego.app.common.util.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.threego.app.payment.model.dao.PaymentDao;
import com.threego.app.payment.model.vo.Payment;

public class PaymentService {

	private final PaymentDao paymentDao = new PaymentDao();

	public List<Payment> findAll(int start, int end) {
		Connection conn = getConnection();
		List<Payment> payments = paymentDao.findAll(conn, start, end);
		close(conn);
		return payments;
	}

	public int getTotalPayment() {
		Connection conn = getConnection();
		int totalPayment = paymentDao.getTotalPayment(conn);
		close(conn);
		return totalPayment;
	}
}
