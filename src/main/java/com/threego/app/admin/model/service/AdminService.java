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
	
}
