package com.threego.app.member.model.service;

import java.sql.Connection;
import java.util.List;

import com.threego.app.member.model.dao.MemberDao;
import com.threego.app.member.model.vo.Member;
import com.threego.app.ticket.model.vo.TicketPayment;

import static  com.threego.app.common.util.JdbcTemplate.*;

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
		int result =0;
		Connection conn = getConnection();
		
		result=memberDao.findByPhone(conn,phone);
		close(conn);	
		
		
		return result;
	}
	
	public List<TicketPayment> findRequestList(String memberId) {
		Connection conn = getConnection();
		List<TicketPayment> requestList = memberDao.findRequestList(conn, memberId);
		close(conn);
	
		return requestList;

	}

}
