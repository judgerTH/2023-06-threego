package com.threego.app.member.model.dao;

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

import com.threego.app.member.model.exception.MemberException;
import com.threego.app.member.model.vo.Member;
import com.threego.app.member.model.vo.MemberRole;
import com.threego.app.request.model.vo.Request;
import com.threego.app.ticket.model.vo.TicketPayment;

public class MemberDao {
	
	Properties prop = new Properties();
	
	public MemberDao() {
		
		String filename = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member findById(Connection conn, String id) {
		
		Member member = null;
		String sql = prop.getProperty("findById");
		// select * from member where id = ?
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			try(ResultSet rset = pstmt.executeQuery()){
				
				while(rset.next()) {
					
					member = handleMemberResultSet(rset);
					
				}
				
			}
			
		} catch (SQLException e) {
			
			throw new MemberException(e);
		}
		
		return member;
	}

	private Member handleMemberResultSet(ResultSet rset) throws SQLException {
		Member member;
		String member_id = rset.getString("id");
		String pwd = rset.getString("pwd");
		String name = rset.getString("name");
		String email = rset.getString("email");
		String phone = rset.getString("phone");
		MemberRole member_role = MemberRole.valueOf(rset.getString("member_role"));
		String post = rset.getString("post");
		String address = rset.getString("address");
		Date regDate = rset.getDate("reg_date");
	 
		return new Member(member_id, pwd, name, email, phone, member_role, post, address, regDate);
	}


	public Member findByEmail(Connection conn, String email) {
		
		Member member = null; 
		String sql = prop.getProperty("findByEmail");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
		
			pstmt.setString(1, email);
			
			try(ResultSet rset = pstmt.executeQuery()){
				
				while(rset.next()) {
					
					member = handleMemberResultSet(rset);
				}
			}
			
		} catch (SQLException e) {

			throw new MemberException(e);
		
		}
		return member;
	}
	
	
	public int updateMember(Connection conn, Member member) {
		int result = 0;
		String sql = prop.getProperty("updateMember");
		// update member set email = ?, phone = ?, post = ?, address = ? where id = ?
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getPost());
			pstmt.setString(4, member.getAddress());
			pstmt.setString(5, member.getId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return result;
	}
	
	public int insertMember(Connection conn, Member member) {
		int result =0;
		String sql = prop.getProperty("insertMember");
		//insertMember = insert into member values(?,?,?,?,?,default,?,?,default)
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getPost());
			pstmt.setString(7, member.getAddress());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return result;
	}

	public int updatePwd(Connection conn, String id, String pwd) {
		int result = 0;
		String sql = prop.getProperty("updatePwd");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {

			throw new MemberException(e);
		}
		
		
		
		return result;
	}


	public int findByPhone(Connection conn, String phone) {
		int result =0;
		String sql =prop.getProperty("findByPhone");
		// findByPhone = select count(*) from member where phone = ?
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, phone);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return result;
	}


	public List<TicketPayment> findPaymentList(Connection conn, String memberId) {
		List<TicketPayment> requestList = new ArrayList<>();
		String sql = "SELECT t.tic_name, t.tic_price, p.p_date, p.p_cnt " +
			                "FROM payment p " +
			                "JOIN ticket t ON p.p_tic_id = t.tic_id " +
			                "WHERE p.p_mem_id = ?";
		
		try ( PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, memberId);
			ResultSet rset = pstmt.executeQuery();
			
			int count = 1;
			
			while(rset.next()) {
				String ticName = rset.getString("tic_name");
			    int ticPrice = rset.getInt("tic_price");
			    Date pDate = rset.getDate("p_date");
			    int pCnt = rset.getInt("p_cnt");
			    
				TicketPayment ticketPayment = new TicketPayment();
				ticketPayment.setNo(count++);
				ticketPayment.setTicName(ticName);
			    ticketPayment.setTicPrice(ticPrice);
			    ticketPayment.setpDate(pDate);
			    ticketPayment.setpCnt(pCnt);

			    // 생성한 TicketPayment 객체를 requestList에 추가
			    requestList.add(ticketPayment);
			}
			
			
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return requestList;
	}

	public List<Request> findRequestList(Connection conn, String memberId) {
		List<Request> reqList = new ArrayList<>();
		  String sql = "SELECT req_no, req_writer, req_location_id, req_photo, req_status, req_date, req_rider, req_cp_date " +
	                 "FROM request " +
	                 "WHERE req_writer = ?";
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			
			pstmt.setString(1, memberId);
			
			try(ResultSet rset = pstmt.executeQuery()){

				while(rset.next()){
					Request request = handleRequestResultSet(rset);
					reqList.add(request);
				}
			}
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return reqList;
	}
	
	private Request handleRequestResultSet(ResultSet rset) throws SQLException {
		int reqNo = rset.getInt("req_no");
		String reqWriter = rset.getString("req_writer");
		String reqLocationId = rset.getString("req_location_id");
		String reqPhoto = rset.getString("req_photo");
		String reqStatus = rset.getString("req_status");
		Date reqData = rset.getDate("req_Date");
		String reqRider = rset.getString("req_rider");
		Date reqCpDate = rset.getDate("req_cp_date");

		return new Request(reqNo, reqWriter, reqLocationId, reqPhoto, reqStatus, reqData, reqRider, reqCpDate);
	}

}
