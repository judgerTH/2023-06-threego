package com.threego.app.payment.model.service;

import static com.threego.app.common.util.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.threego.app.payment.model.dao.PaymentDao;
import com.threego.app.payment.model.vo.Payment;
import com.threego.app.payment.model.vo.PaymentDetail;

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

	public int insertPayment(String id, String ticketId) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = paymentDao.insertPayment(conn, id, ticketId);
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public Payment findPayment(String id) {
		 Payment payment = new Payment();
	      Connection conn = getConnection();
	      try {
	         payment = paymentDao.findPayment(conn, id);
	         commit(conn);
	      } catch (Exception e) {
	         rollback(conn);
	         throw e;
	      }finally {
	         close(conn);
	      }
	      
	      return payment;
	}

	public List<PaymentDetail> findAllPaymentDetail(int start, int end) {
		Connection conn = getConnection();
		List<PaymentDetail> paymentDetails = paymentDao.findAllPaymentDetail(conn, start, end);
		close(conn);
		return paymentDetails;
	}

	public int getTotalPaymentDetail() {
		Connection conn = getConnection();
		int totalPaymentDetail = paymentDao.getTotalPaymentDetail(conn);
		close(conn);
		return totalPaymentDetail;
	}


}
