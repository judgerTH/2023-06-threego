package com.threego.app.admin.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.threego.app.admin.model.exception.AdminException;
import com.threego.app.member.model.vo.Member;
import com.threego.app.member.model.vo.MemberRole;
import com.threego.app.rider.model.vo.Rider;
import com.threego.app.board.model.vo.Board;
import com.threego.app.board.model.vo.BoardType;
import com.threego.app.warning.model.vo.WarnigMemberRole;
import com.threego.app.warning.model.vo.Warning;



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
	public int getSignUpTodayCount(Connection conn) {
		int todayCount = 0;
		String sql = prop.getProperty("getSignUpTodayCount"); // select count(*) from board
		
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

	// 어제 방문자수 db에서 받아오기
	public int getSignUpYesterdayCount(Connection conn) {
		int yesterdayCount = 0;
		String sql = prop.getProperty("getSignUpYesterdayCount"); // select count(*) from board
		
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
	public int getSignUpTwoDayAgoCount(Connection conn) {
		int twoDayAgoCount = 0;
		String sql = prop.getProperty("getSignUpTwoDayAgoCount"); // select count(*) from board
		
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
	public int getSignUpThreeDayAgoCount(Connection conn) {
		int threeDayAgoCount = 0;
		String sql = prop.getProperty("getSignUpThreeDayAgoCount"); // select count(*) from board
		
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

	public int getTodayPaymentCount(Connection conn) {
		int paymentCount = 0;
		String sql = prop.getProperty("getTodayPaymentCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					paymentCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return paymentCount;
	}

	public int getYesterdayPaymentCount(Connection conn) {
		int paymentCount = 0;
		String sql = prop.getProperty("getYesterdayPaymentCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					paymentCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return paymentCount;
	}

	public int getTwoDayAgoPaymentCount(Connection conn) {
		int paymentCount = 0;
		String sql = prop.getProperty("getTwoDayAgoPaymentCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					paymentCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return paymentCount;
	}

	public int getThreeDayAgoPaymentCount(Connection conn) {
		int paymentCount = 0;
		String sql = prop.getProperty("getThreeDayAgoPaymentCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					paymentCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return paymentCount;
	}

	public int getUnapprovedRiderCount(Connection conn) {
		int unapprovedRiderCount = 0;
		String sql = prop.getProperty("getUnapprovedRiderCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					unapprovedRiderCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return unapprovedRiderCount;
	}

	public int getCanceledRequestCount(Connection conn) {
		int canceledRequestCount = 0;
		String sql = prop.getProperty("getCanceledRequestCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					canceledRequestCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return canceledRequestCount;
	}

	public int getWarningCount(Connection conn) {
		int warningCount = 0;
		String sql = prop.getProperty("getWarningCount");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					warningCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return warningCount;
	}

	public int getCountOfBoardWithOutComment(Connection conn) {
		int countOfBoardWithOutComment = 0;
		String sql = prop.getProperty("getCountOfBoardWithOutComment");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next())
					countOfBoardWithOutComment = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return countOfBoardWithOutComment;
	}

	// 모든 신고내역 조회
	public List<Warning> findAllReports(Connection conn) {
		List<Warning> warnings = new ArrayList<>();
		String sql = prop.getProperty("findAllReports");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Warning warning = handleReportResultSet(rset);
					warnings.add(warning);
				}
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return warnings;
	}

	private Warning handleReportResultSet(ResultSet rset) throws SQLException{
		int warningNo = rset.getInt("w_no");
		int warningReqNo = rset.getInt("w_req_no");
		String warningWriter = rset.getString("w_writer");
		String warningContent = rset.getString("w_content");
		Date warningRegDate = rset.getDate("w_reg_date");
		int warningConfirm = rset.getInt("w_confirm");
		String warningCaution = rset.getString("w_confirm");
		WarnigMemberRole memberRole = WarnigMemberRole.valueOf(rset.getString("member_role"));
		
		return new Warning(warningNo, warningReqNo, warningWriter, warningContent, warningRegDate, warningConfirm, warningCaution, memberRole);
	}

	public List<Warning> findSixReports(Connection conn) {
		List<Warning> warnings = new ArrayList<>();
		String sql = prop.getProperty("findAllReportsOnlySix");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Warning warning = handleReportResultSet(rset);
					warnings.add(warning);
				}
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return warnings;
	}

	public List<Board> findSixBoards(Connection conn) {
		List<Board> boards = new ArrayList<>();
		String sql = prop.getProperty("findSixBoards");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Board board = handleBoardResultSet(rset);
					boards.add(board);
				}
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return boards;
	}

	private Board handleBoardResultSet(ResultSet rset) throws SQLException {
		int boardNo = rset.getInt("b_no");
		BoardType boardType = BoardType.valueOf(rset.getString("b_type"));
		String boardTitle = rset.getString("b_tittle");
		String boardWriter = rset.getString("b_writer");
		String boardContent = rset.getString("b_content");
		Date boardRegDate = rset.getDate("b_reg_date");
		int boardCnt = rset.getInt("b_cnt");
		
		return new Board(boardNo, boardType, boardTitle, boardWriter, boardContent, boardRegDate, boardCnt);

	}

	public List<Member> findById(Connection conn, String memberId) {
		List<Member> members = new ArrayList<>();
		String sql = prop.getProperty("findById");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, memberId);
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Member member = handleMemberResultSet(rset);
					members.add(member);
				}
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return members;
	}

	public List<Member> findByName(Connection conn, String memberName) {
		List<Member> members = new ArrayList<>();
		String sql = prop.getProperty("findByName");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, memberName);
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Member member = handleMemberResultSet(rset);
					members.add(member);
				}
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return members;
	}
	public List<Board> getInquiryBoard(Connection conn, int start, int end) {
		List<Board> boards = new ArrayList<>();
		String sql = prop.getProperty("getInquiryBoard");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Board board = handleBoardResultSet(rset);
					boards.add(board);
				}
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return boards;
	}

	public List<Rider> getAllRiderList(Connection conn) {
		List<Rider> riders = new ArrayList<>();
		String sql = prop.getProperty("getAllRiderList");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Rider rider = handleRiderResultSet(rset);
					riders.add(rider);
				}
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return riders;
	}

	private Rider handleRiderResultSet(ResultSet rset) throws SQLException{
		String riderId = rset.getString("r_id");
		String riderLocationId = rset.getString("r_location_id");
		String riderLocationName = rset.getString("l_name");
		String riderStatus = rset.getString("r_status");
		Date riderRegDate = rset.getDate("r_reg_date");
		Date riderUpDate = rset.getDate("up_Date");
		
		return new Rider(riderId, riderLocationId, riderStatus, riderRegDate, riderUpDate, riderLocationName);
	}

	public List<Rider> getApproveRiderList(Connection conn) {
		List<Rider> waitingRiders = new ArrayList<>();
		String sql = prop.getProperty("getApproveRiderList");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					String riderId = rset.getString("r_id");
					String riderLocationId = rset.getString("r_location_id");
					String riderLocationName = rset.getString("l_name");
					String riderStatus = rset.getString("r_status");
					Date riderRegDate = rset.getDate("r_reg_date");
					Date riderUpDate = rset.getDate("up_Date");;
					String riderName = rset.getString("name");
					
					Rider waitingRider = new Rider(riderId, riderLocationId, riderStatus, riderRegDate, riderUpDate, riderLocationName, riderName);
					waitingRiders.add(waitingRider);
				}
			}
		} catch (SQLException e) {
			throw new AdminException(e);
		}
		return waitingRiders;
	}

	
	
}
