package com.threego.app.request.model.dao;

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
import com.threego.app.payment.model.vo.Payment;
import com.threego.app.request.model.exception.RequestException;
import com.threego.app.request.model.vo.Request;


public class RequestDao {

	Properties prop = new Properties();

	public RequestDao() {

		String filename = RequestDao.class.getResource("/sql/request/request-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public List<Request> findAllRequest(Connection conn) {
		List<Request> requestList = new ArrayList<>();
		String sql = prop.getProperty("findAllRequest");

		try(PreparedStatement pstmt = conn.prepareStatement(sql)){

			try(ResultSet rset = pstmt.executeQuery()){

				while(rset.next()){
					Request requset = handleRequestResultSet(rset);
					requestList.add(requset);

				}

			}

		} catch (SQLException e) {

			throw new RequestException(e);
		}

		return requestList;
	}

	private Request handleRequestResultSet(ResultSet rset) throws SQLException {
		int reqNo = rset.getInt("req_no");
		String reqWriter = rset.getString("req_writer");
		String reqLocationId = rset.getString("location_name");
		String reqPost = rset.getString("req_post");
		String reqAddress = rset.getString("req_address");
		String reqPhoto = rset.getString("req_photo");
		String reqStatus = rset.getString("req_status");
		Date reqData = rset.getDate("req_date");
		String reqRider = rset.getString("req_rider");
		Date reqCpDate = rset.getDate("req_cp_date");
		return new Request(reqNo, reqWriter, reqLocationId, reqPost, reqAddress, reqPhoto, reqStatus, reqData, reqRider, reqCpDate);
	}

	public int updateRequest(Connection conn, int reqNo, String rId, String reqStatus) {

		int result = 0; 
		String sql = prop.getProperty("updateRequest");
		// update request set req_status = ? , req_rider = ? where req_no = ?

		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, reqStatus);
			pstmt.setString(2, rId);
			pstmt.setInt(3, reqNo);

			result = pstmt.executeUpdate();


		} catch (SQLException e) {
			throw new RequestException(e);
		}
		return result;
	}

	public Request findByReqno(Connection conn, int reqNo) {

		Request acceptedRequest = null; 
		String sql = prop.getProperty("findByReqno");
		// select r.*, (select l_name from location where l_id = r.req_location_id) location_name from request r where req_no = ?

		try(PreparedStatement pstmt = conn.prepareStatement(sql)){

			pstmt.setInt(1, reqNo);

			try(ResultSet rset = pstmt.executeQuery()){

				while(rset.next()) {

					acceptedRequest = handleRequestResultSet(rset);

				}
			}

		} catch (SQLException e) {

			throw new RequestException(e);
		}

		return acceptedRequest;
	}

	public List<Request> findByMyReq(Connection conn, int start, int end, String id) {
	    List<Request> requestList = new ArrayList<>();
	    String sql = prop.getProperty("findByMyReq");
	    try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			pstmt.setInt(2, end);
			pstmt.setInt(3, start);
			try(ResultSet rset = pstmt.executeQuery()){

				while(rset.next()) {

					Request request = handleRequestResultSet(rset);
					requestList.add(request);
				}
			}

		} catch (SQLException e) {

			throw new RequestException(e);
		}

		return requestList;
	}

	//INSERT INTO request (req_no, req_writer, req_location_id, req_post, req_address, req_photo, req_status, req_date, req_rider, req_cp_date)
	//VALUES (seq_req_no.NEXTVAL, ?, ?, ?, ?, ?, '0', SYSDATE, NULL, NULL)
	public boolean reqGarbagePickup(Connection conn, String id, String location, String post, String address, String photo) {
	    boolean result = false;
	    String sql = prop.getProperty("reqGarbagePickup");
	    
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, id);
	        pstmt.setString(2, location);
	        pstmt.setString(3, post);
	        pstmt.setString(4, address);
	        pstmt.setString(5, photo);

	        int rowsInserted = pstmt.executeUpdate();
	        if (rowsInserted > 0) {
	            result = true;
	        }
	    } catch (SQLException e) {
	        throw new RequestException(e);
	    }

	    return result;
	}

	public int countUpdate(Connection conn, String id) {
        int result = 0;
        String sql = "update payment set p_cnt = p_cnt -1, p_use_cnt = p_use_cnt +1 where p_mem_id = ?";
        
        try(PreparedStatement pstmt = conn.prepareStatement(sql)){
           pstmt.setString(1, id);
           
           result = pstmt.executeUpdate();


        } catch (SQLException e) {
           throw new RequestException(e);
        }
        return result;
     }

	public int insertRequest(Connection conn, String _writer, String msg) {
		int result = 0; 
		String sql = prop.getProperty("insertRequest");
		// insert into msgbox values(seq_msg_no.nextval, 'P', 'admin', ?, ?, default, default)

		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, _writer);
			pstmt.setString(2, msg);

			result = pstmt.executeUpdate();


		} catch (SQLException e) {
			throw new RequestException(e);
		}
		return result;
	}

		public Payment findPayment(Connection conn, String id) {
			Payment payment = null;
			String sql = "select * from payment where p_mem_id = ?";
			
			try(PreparedStatement pstmt = conn.prepareStatement(sql)){
				pstmt.setString(1, id);
				try(ResultSet rset = pstmt.executeQuery()){
					while(rset.next()) {
						payment = handlePaymentResultSet(rset);
					}
				}
				
			} catch (SQLException e) {
				throw new RequestException(e);
			}
			return payment;
			
		}

		private Payment handlePaymentResultSet(ResultSet rset) throws SQLException {
			Payment payment = new Payment();
			payment.setP_no(rset.getInt("p_no"));
			payment.setP_mem_id(rset.getString("p_mem_id"));
			payment.setP_tic_id(rset.getString("p_tic_id"));
			payment.setP_date(rset.getDate("p_date"));
			payment.setP_cnt(rset.getInt("p_cnt"));
			payment.setP_use_cnt(rset.getInt("p_use_cnt"));

			return payment;
		}

		public int deletePayment(Connection conn, String id) {
			int result = 0;
			String sql = "delete from payment where p_mem_id = ?";
			
			try(PreparedStatement pstmt = conn.prepareStatement(sql)){
				pstmt.setString(1, id);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				throw new RequestException(e);
			}
			return result;
		}

		public int getTotalCollection(Connection conn, String id) {
			int totalCollection = 0;
			String sql = prop.getProperty("getTotalCollection");
			try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
				pstmt.setString(1, id);
				try(ResultSet rset = pstmt.executeQuery()) {
					while(rset.next())
						totalCollection = rset.getInt(1);
				}
			} catch (SQLException e) {
				throw new RequestException(e);
			}
			return totalCollection;
		}

}
