package com.threego.app.rider.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.threego.app.member.model.dao.MemberDao;
import com.threego.app.member.model.exception.MemberException;
import com.threego.app.rider.model.exception.RiderException;
import com.threego.app.rider.model.vo.Rider;

public class RiderDao {
Properties prop = new Properties();
	
	public RiderDao() {
		
		String filename = MemberDao.class.getResource("/sql/rider/rider-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertRider(Connection conn, Rider rider) {
		int result =0;
		String sql = prop.getProperty("insertRider");
		//insertRider = insert into rider values (?, ?,default, default,default, ?)
		// 
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, rider.getRiderId());
			pstmt.setString(2, rider.getRiderLocationId());
			pstmt.setString(3, rider.getFileName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new MemberException(e);
		}
		return result;
	}

	public Rider findRiderById(Connection conn, String riderId) {
		Rider rider = null;
		String sql = prop.getProperty("findRiderById");
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, riderId);
			try (ResultSet rset = pstmt.executeQuery()) {
				if (rset.next())
					rider = handleRiderResultSet(rset);
			}
		} catch (SQLException e) {
			throw new RiderException(e);
		}
		return rider;
	}

	private Rider handleRiderResultSet(ResultSet rset) throws SQLException{
		Rider rider = new Rider();
		rider.setRiderId(rset.getString("r_id"));
		rider.setRiderLocationId(rset.getString("r_location_id"));
		rider.setRiderStatus(rset.getString("r_status"));
		rider.setRiderRegDate(rset.getDate("r_reg_date"));
		rider.setRiderUpDate(rset.getDate("up_date"));
		
		return rider;
	}

}
