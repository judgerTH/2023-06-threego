package com.threego.app.request.model.service;

import java.sql.Connection;
import java.util.List;

import com.threego.app.payment.model.vo.Payment;
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

	public int updateRequest(int reqNo, String rId, String reqStatus) {
		Connection conn = getConnection();
		int result = 0; 
		try {
			result = requestDao.updateRequest(conn, reqNo, rId, reqStatus);
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

	public List<Request> findByMyReq(String id) {
		Connection conn = getConnection();
		List<Request> requestList = requestDao.findByMyReq(conn, id);
		close(conn);
		return requestList;
	}

	public boolean reqGarbagePickup(String id, String location, String post, String address, String photo) {
        Connection conn = getConnection();
        boolean result = false;

        try {
            result = requestDao.reqGarbagePickup(conn, id, location, post, address, photo);
            commit(conn);
        } catch (Exception e) {
            rollback(conn);
            e.printStackTrace();
            // 오류 처리 로직을 추가해야 함
        } finally {
            close(conn);
        }

        return result;
    }

	public int countUpdate(String id) {
	      Connection conn = getConnection();
	      int result = 0; 
	      try {
	         result = requestDao.countUpdate(conn, id);
	         commit(conn);
	         
	      } catch (Exception e) {
	         rollback(conn);
	         throw e;
	      
	      }finally {
	         close(conn);
	      }
	      
	      return result;
	   }

	public Payment findPayment(String id) {
	      Payment payment = null;
	      Connection conn = getConnection();
	      try {
	         payment = requestDao.findPayment(conn, id);
	         commit(conn);
	      } catch (Exception e) {
	         rollback(conn);
	         throw e;
	      }finally {
	         close(conn);
	      }
	      
	      return payment;
	   }

	public int deletePayment(String id) {
      Connection conn = getConnection();
      int result = 0; 
      try {
         result = requestDao.deletePayment(conn, id);
         commit(conn);
      } catch (Exception e) {
         rollback(conn);
         throw e;
      }finally {
         close(conn);
      }
      return result;
   }
	public int insertRequest(String _writer, String msg) {
		// 접수취소 시 or 수거 완료 시 메세지함 전송
		Connection conn = getConnection();
		int result = 0; 
		try {
			result = requestDao.insertRequest(conn, _writer, msg);
			commit(conn);
			
		} catch (Exception e) {
			rollback(conn);
			throw e;
		
		}finally {
			close(conn);
		}
		
		return result;
	}


}
