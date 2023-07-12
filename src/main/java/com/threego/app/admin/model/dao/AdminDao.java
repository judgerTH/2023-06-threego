package com.threego.app.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.threego.app.admin.model.exception.AdminException;


public class AdminDao {

private Properties prop = new Properties();
	
	public AdminDao() {
		String filename = 
			AdminDao.class.getResource("/sql/admin/admin-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	// 오늘 방문자 수 db에서 받아오기
	public int getVisitTodayCount(Connection conn) {
		int todayCount = 0;
		String sql = prop.getProperty("getVisitTodayCount"); // select count(*) from board
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				while(rset.next())
					todayCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return todayCount;
	}
	
	// 방문자수 증가시키기
	public void setVisitTotalCount(Connection conn) {
		String sql = prop.getProperty("setVisitTotalCount"); // select count(*) from board
	
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			 pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new AdminException(e);
		}
	}

	// 어제 방문자수 db에서 받아오기
	public int getVisitYesterdayCount(Connection conn) {
		int yesterdayCount = 0;
		String sql = prop.getProperty("getVisitYesterdayCount"); // select count(*) from board
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				while(rset.next())
					yesterdayCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return yesterdayCount;
	}

	// 2틀 전 방문자 수 db에서 받기
	public int getVisitTwoDayAgoCount(Connection conn) {
		int twoDayAgoCount = 0;
		String sql = prop.getProperty("getVisitTwoDayAgoCount"); // select count(*) from board
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				while(rset.next())
					twoDayAgoCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return twoDayAgoCount;
	}
	
	// 3일 전 방문자 수 db에서 받기
	public int getVisitThreeDayAgoCount(Connection conn) {
		int threeDayAgoCount = 0;
		String sql = prop.getProperty("getVisitThreeDayAgoCount"); // select count(*) from board
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				while(rset.next())
					threeDayAgoCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return threeDayAgoCount;
	}

	public int getlastMonthPayment(Connection conn) {
		int lastMonthPayment = 0;
		String sql = prop.getProperty("getlastMonthPayment");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					lastMonthPayment = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return lastMonthPayment;
	}

	public int getthisMonthPayment(Connection conn) {
		int thisMonthPayment = 0;
		String sql = prop.getProperty("getthieMonthPayment");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					thisMonthPayment = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return thisMonthPayment;
	}

	public int getTodayPayment(Connection conn) {
		int todayPayment = 0;
		String sql = prop.getProperty("getTodayPayment");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					todayPayment = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return todayPayment;
	}

	
	
}
