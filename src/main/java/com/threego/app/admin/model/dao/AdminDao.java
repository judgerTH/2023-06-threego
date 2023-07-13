package com.threego.app.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.threego.app.admin.model.exception.AdminException;
import com.threego.app.member.model.vo.Member;
import com.threego.app.member.model.vo.MemberRole;


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
		String sql = prop.getProperty("getthisMonthPayment");
		
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

	public int getYesterdayPayment(Connection conn) {
		int yesterdayPayment = 0;
		String sql = prop.getProperty("getYesterdayPayment");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					yesterdayPayment = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return yesterdayPayment;
	}

	public int getTwoDayAgoPayment(Connection conn) {
		int twoDayAgoPayment = 0;
		String sql = prop.getProperty("getTwoDayAgoPayment");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					twoDayAgoPayment = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return twoDayAgoPayment;
	}

	public int getThreeDayAgoPayment(Connection conn) {
		int threeDayAgoPayment = 0;
		String sql = prop.getProperty("getThreeDayAgoPayment");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					threeDayAgoPayment = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return threeDayAgoPayment;
	}

	public List<Member> findAll(Connection conn, int start, int end) {
		List<Member> members = new ArrayList<>();
		String sql = prop.getProperty("findAll");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Member member = handleMemberResultSet(rset);
					members.add(member);
				}
			}
		} catch(SQLException e) {
			throw new AdminException(e);
		}
		return members;
	}

	private Member handleMemberResultSet(ResultSet rset) throws SQLException {
		Member member = new Member();
		member.setId(rset.getString("id"));
		member.setName(rset.getString("name"));
		member.setEmail(rset.getString("email"));
		member.setPhone(rset.getString("phone"));
		MemberRole memberRole = MemberRole.valueOf(rset.getString("member_role"));
		member.setMemberRole(memberRole);
		member.setPost(rset.getString("post"));
		member.setAddress(rset.getString("address"));
		member.setRegDate(rset.getDate("reg_date"));
		return member;
	}

	public int getTotalMember(Connection conn) {
		int totalMember = 0;
		String sql = prop.getProperty("getTotalMember");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next())
					totalMember = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return totalMember;
	}

	public int memberDelete(Connection conn, String id) {
		int result = 0;
		String sql = prop.getProperty("memberDelete");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, id);
			System.out.println(id);
			result = pstmt.executeUpdate();
			System.out.println(result);
		}catch (SQLException e) {
			throw new AdminException(e);
		}
		return result;
	}

	
	
}
