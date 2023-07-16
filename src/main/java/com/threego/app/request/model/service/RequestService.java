package com.threego.app.request.model.service;

import java.sql.Connection;
import java.util.List;

import com.threego.app.request.model.dao.RequestDao;
import com.threego.app.request.model.vo.Request;
import static  com.threego.app.common.util.JdbcTemplate.*;


public class RequestService {
	
	private final RequestDao requestDao = new RequestDao();

	public List<Request> findAllRequest() {
		Connection conn = getConnection();
		List<Request> requestList = requestDao.findAllRequest(conn); 
		close(conn);
		return requestList;
	}

	public int acceptRequest(int reqNo, String rId) {
		Connection conn = getConnection();
		int result = 0; 
		try {
			result = requestDao.acceptRequest(conn, reqNo, rId);
			commit(conn);
			
		} catch (Exception e) {
			rollback(conn);
			throw e;
		
		}finally {
			close(conn);
		}
		
		return result;
	}

	public Request findByReqno(int reqNo) {
		Request acceptedRequest = null; 
		Connection conn = getConnection();
		
		try {
			
			acceptedRequest = requestDao.findByReqno(conn, reqNo);
			commit(conn);
			
		} catch (Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		
		return acceptedRequest;
	}


}
