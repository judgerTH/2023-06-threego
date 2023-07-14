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
					System.out.println("requestList@dao = " + requestList);
				}
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			// throw new RequestException(e);
		}
		
		return requestList;
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
