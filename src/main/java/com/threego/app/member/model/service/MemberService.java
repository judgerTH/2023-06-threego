package com.threego.app.member.model.service;

import java.sql.Connection;

import com.threego.app.member.model.dao.MemberDao;
import com.threego.app.member.model.vo.Member;
import static  com.threego.app.common.util.JdbcTemplate.*;

public class MemberService {
	
	private final MemberDao memberDao = new MemberDao();

	public Member findById(String id) {
		
		Connection conn = getConnection();
		Member member = memberDao.findById(conn, id);
		close(conn);
		
		return member;
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

}
