package com.threego.app.admin.model.service;

import static com.threego.app.common.util.JdbcTemplate.close;
import static com.threego.app.common.util.JdbcTemplate.getConnection;

import java.sql.Connection;

import com.threego.app.admin.model.dao.AdminDao;

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

	
}
