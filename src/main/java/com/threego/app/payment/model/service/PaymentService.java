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


	public List<Payment> findByDate(int start, int end, String startDay, String endDay) {
		Connection conn = getConnection();
		List<Payment> payments = paymentDao.findByDate(conn, start, end, startDay, endDay);
		close(conn);
		return payments;
	}



	public int insertPayment(String memberId, String ticketId, int purchaseCount) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = paymentDao.insertPayment(conn, memberId, ticketId, purchaseCount);
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}


}
