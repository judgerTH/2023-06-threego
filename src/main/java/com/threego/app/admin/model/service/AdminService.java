package com.threego.app.admin.model.service;

import static com.threego.app.common.util.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.threego.app.admin.model.dao.AdminDao;
import com.threego.app.member.model.vo.Member;

public class AdminService {

	private final AdminDao adminDao = new AdminDao();

	public int getVisitTodayCount() {
		Connection conn = getConnection();
		int todayCount = adminDao.getVisitTodayCount(conn);
		close(conn);
		return todayCount;
	}

	public void setVisitTotalCount() {
		Connection conn = getConnection();
		adminDao.setVisitTotalCount(conn);
		close(conn);
	}

	public int getVisitYesterdayCount() {
		Connection conn = getConnection();
		int yesterdayCount = adminDao.getVisitYesterdayCount(conn);
		close(conn);
		return yesterdayCount;
	}

	public int getVisitTwoDayAgoCount() {
		Connection conn = getConnection();
		int twoDayAgoCount = adminDao.getVisitTwoDayAgoCount(conn);
		close(conn);
		return twoDayAgoCount;
	}

	public int getVisitThreeDayAgoCount() {
		Connection conn = getConnection();
		int threeDayAgoCount = adminDao.getVisitThreeDayAgoCount(conn);
		close(conn);
		return threeDayAgoCount;
	}

	public int getlastMonthPayment() {
		Connection conn = getConnection();
		int lastMonthPayment = adminDao.getlastMonthPayment(conn);
		close(conn);
		return lastMonthPayment;
	}

	public int getthisMonthPayment() {
		Connection conn = getConnection();
		int thisMonthPayment = adminDao.getthisMonthPayment(conn);
		close(conn);
		return thisMonthPayment;
	}

	public int getTodayPayment() {
		Connection conn = getConnection();
		int todayPayment = adminDao.getTodayPayment(conn);
		close(conn);
		return todayPayment;
	}

	public int getYesterdayPayment() {
		Connection conn = getConnection();
		int yesterdayPayment = adminDao.getYesterdayPayment(conn);
		close(conn);
		return yesterdayPayment;
	}

	public int getTwoDayAgoPayment() {
		Connection conn = getConnection();
		int twoDayAgoPayment = adminDao.getTwoDayAgoPayment(conn);
		close(conn);
		return twoDayAgoPayment;
	}

	public int getThreeDayAgoPayment() {
		Connection conn = getConnection();
		int threeDayAgoPayment = adminDao.getThreeDayAgoPayment(conn);
		close(conn);
		return threeDayAgoPayment;
	}

	public List<Member> findAll(int start, int end) {
		Connection conn = getConnection();
		List<Member> members = adminDao.findAll(conn, start, end);
		close(conn);
		return members;
	}

	public int getTotalMember() {
		Connection conn = getConnection();
		int totalMember = adminDao.getTotalMember(conn);
		close(conn);
		return totalMember;
	}

	public int memberDelete(String id) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = adminDao.memberDelete(conn, id);
			commit(conn);
		}catch (Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	
	}

	
}
