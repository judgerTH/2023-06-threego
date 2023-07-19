package com.threego.app.payment.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.threego.app.admin.model.dao.AdminDao;
import com.threego.app.payment.model.exception.PaymentException;
import com.threego.app.payment.model.vo.Payment;
import com.threego.app.request.model.exception.RequestException;

public class PaymentDao {

	private Properties prop = new Properties();
	
	public PaymentDao() {
		String filename = 
				PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();
			try {
				prop.load(new FileReader(filename));
			} catch (IOException e) {
				e.printStackTrace();
			}
	}

	public List<Payment> findAll(Connection conn, int start, int end) {
		List<Payment> payments = new ArrayList<>();
		String sql = prop.getProperty("findAll");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Payment payment = handlePaymentResultSet(rset);
					payments.add(payment);
				}
			}
		}catch (SQLException e) {
			throw new PaymentException(e);
		}
		return payments;
	}

	private Payment handlePaymentResultSet(ResultSet rset) throws SQLException {
		Payment payment = new Payment();
		payment.setP_no(rset.getInt("p_no"));
		payment.setP_mem_id(rset.getString("p_mem_id"));
		payment.setP_tic_id(rset.getString("p_tic_id"));
		payment.setP_date(rset.getDate("p_date"));
		payment.setP_cnt(rset.getInt("p_cnt"));
		payment.setP_use_cnt(rset.getInt("p_use_cnt"));

		return payment;
	}
	
	public List<Payment> findByDate(Connection conn, int start, int end, String startDay, String endDay) {
		List<Payment> payments = new ArrayList<>();
		String sql = prop.getProperty("findByDate");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, startDay);
			pstmt.setString(4, endDay);
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Payment payment = handlePaymentResultSet(rset);
					payments.add(payment);
				}
			}
		} catch (SQLException e) {
			throw new PaymentException(e);
		}
		return payments;
	}

	public int getTotalPayment(Connection conn) {
		int totalPayment = 0;
		String sql = prop.getProperty("getTotalPayment");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next())
					totalPayment = rset.getInt(1);
			}
		}catch (SQLException e) {
			throw new PaymentException(e);
		}
		return totalPayment;
	}


	public int insertPayment(Connection conn, String id, String ticketId) {
		int result= 0;
		String sql = prop.getProperty("insertPayment");
		
		// INSERT INTO payment (p_no, p_mem_id, p_tic_id, p_cnt, p_use_cnt) VALUES (seq_payment_no.NEXTVA, ?, ?, ?, 0)
		try ( PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, id);
			pstmt.setString(2, ticketId);
			String str = ticketId;
			int cnt = Integer.parseInt(str.substring(3)); // "tic1"
			pstmt.setInt(3, cnt);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new PaymentException(e);
		}
		
		return result;
	}

	public Payment findPayment(Connection conn, String id) {
		Payment payment = new Payment();
		String sql = "select * from payment where p_mem_id = ?";
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			try(ResultSet rset = pstmt.executeQuery()){
				while(rset.next()) {
					payment = handlePaymentResultSet(rset);
					System.out.println("payment@dao = " + payment);
				}
			}
			
		} catch (SQLException e) {
			throw new RequestException(e);
		}
		return payment;
		
	}



}
