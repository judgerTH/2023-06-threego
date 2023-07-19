package com.threego.app.member.model.service;

import static com.threego.app.common.util.JdbcTemplate.close;
import static com.threego.app.common.util.JdbcTemplate.commit;
import static com.threego.app.common.util.JdbcTemplate.getConnection;
import static com.threego.app.common.util.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.threego.app.member.model.dao.MemberDao;
import com.threego.app.member.model.vo.Member;
import com.threego.app.msgbox.model.vo.MsgBox;
import com.threego.app.payment.model.vo.PaymentDetail;
import com.threego.app.request.model.vo.Request;

public class MemberService {
	
	private final MemberDao memberDao = new MemberDao();

	public Member findById(String id) {
		
		Connection conn = getConnection();
		Member member = memberDao.findById(conn, id);
		close(conn);
		
		return member;
	}


	public Member findByEmail(String email) {
		Connection conn = getConnection();
		Member member = memberDao.findByEmail(conn, email);
		close(conn);
		
		return member;
	}

	
	public int updateMember(Member member) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = memberDao.updateMember(conn, member);
			System.out.println(result);
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
	
	public int insertMember(Member member) {
		int result =0;
		Connection conn = getConnection();
		try {
			result = memberDao.insertMember(conn,member);
			commit(conn);
		}catch (Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}


	public int updatePwd(String id, String pwd) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.updatePwd(conn, id, pwd);
			commit(conn);
			
		} catch (Exception e) {
			rollback(conn);
			throw e;
		
		}finally {
			close(conn);
		}
		
		
		return result;
	}


	public int findByPhone(String phone) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.findByPhone(conn, phone);
			commit(conn);
			
		} catch (Exception e) {
			rollback(conn);
			throw e;
		
		}finally {
			close(conn);
		}
		
		
		return result;
	}
	
	public List<PaymentDetail> findPaymentList(String memberId) {
		// 마이페이지 - 결제정보
		Connection conn = getConnection();
		List<PaymentDetail> requestList = memberDao.findPaymentList(conn, memberId);
		close(conn);
	
		return requestList;

	}


	public List<Request> findRequestList(String memberId) {
		// 마이페이지 - 수거목록
		Connection conn = getConnection();
		List<Request> requestList = memberDao.findRequestList(conn, memberId);
		close(conn);
		return requestList;
	}


	public List<MsgBox> getMsgBoxList(String memberId) {
		// 마이페이지 - 받은 메세지함
		Connection conn = getConnection();
		List<MsgBox> msgBoxes = memberDao.getMsgBoxList(conn, memberId);
		close(conn);
		return msgBoxes;
	}


	public PaymentDetail findTotalPrice(String memberId) {
		// 마이페이지 - 결제정보 - 누적금액 조회
		Connection conn = getConnection();
		PaymentDetail paymentDetail = memberDao.findTotalPrice(conn, memberId);
		close(conn);
		
		return paymentDetail;
	}


	

}
