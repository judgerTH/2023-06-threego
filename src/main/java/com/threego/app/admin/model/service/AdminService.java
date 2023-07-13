package com.threego.app.admin.model.service;

import static com.threego.app.common.util.JdbcTemplate.close;
import static com.threego.app.common.util.JdbcTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.threego.app.admin.model.dao.AdminDao;
import com.threego.app.board.model.vo.Board;
import com.threego.app.warning.model.vo.Warning;

public class AdminService {

	private final AdminDao adminDao = new AdminDao();

	// 오늘 방문자수 서비스
	public int getVisitTodayCount() {
		Connection conn = getConnection();
		int todayCount = adminDao.getVisitTodayCount(conn);
		close(conn);
		return todayCount;
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

	public int getTodayPaymentCount() {
		Connection conn = getConnection();
		int paymentCount = adminDao.getTodayPaymentCount(conn);
		close(conn);
		return paymentCount;
	}

	public int getYesterdayPaymentCount() {
		Connection conn = getConnection();
		int yesterdayPaymentCount = adminDao.getYesterdayPaymentCount(conn);
		close(conn);
		return yesterdayPaymentCount;
	}

	public int getTwoDayAgoPaymentCount() {
		Connection conn = getConnection();
		int twoDayAgoPaymentCount = adminDao.getTwoDayAgoPaymentCount(conn);
		close(conn);
		return twoDayAgoPaymentCount;
	}

	public int getThreeDayAgoPaymentCount() {
		Connection conn = getConnection();
		int threeDayAgoPaymentCount = adminDao.getThreeDayAgoPaymentCount(conn);
		close(conn);
		return threeDayAgoPaymentCount;
	}

	public int getUnapprovedRiderCount() {
		Connection conn = getConnection();
		int unapprovedRiderCount = adminDao.getUnapprovedRiderCount(conn);
		close(conn);
		return unapprovedRiderCount;
	}

	public int getCanceledRequestCount() {
		Connection conn = getConnection();
		int canceledRequestCount = adminDao.getCanceledRequestCount(conn);
		close(conn);
		return canceledRequestCount;
	}

	public int getWarningCount() {
		Connection conn = getConnection();
		int warningCount = adminDao.getWarningCount(conn);
		close(conn);
		return warningCount;
	}

	public int getCountOfBoardWithOutComment() {
		Connection conn = getConnection();
		int countOfBoardWithOutComment = adminDao.getCountOfBoardWithOutComment(conn);
		close(conn);
		return countOfBoardWithOutComment;
	}

	// 모든 신고내역 조회 서비스
	public List<Warning> findAllReports() {
		Connection conn = getConnection();
		List<Warning> warnings = adminDao.findAllReports(conn);
		close(conn);
		return warnings;
	}

	// 신고내역 최신순 6개
	public List<Warning> findSixReports() {
		Connection conn = getConnection();
		List<Warning> warnings = adminDao.findSixReports(conn);
		close(conn);
		return warnings;
	}

	// 문의사항 최신순 6개
	public List<Board> findSixBoards() {
		Connection conn = getConnection();
		List<Board> boards = adminDao.findSixBoards(conn);
		close(conn);
		return boards;
	}

	
}
