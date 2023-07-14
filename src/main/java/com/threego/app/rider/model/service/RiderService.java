package com.threego.app.rider.model.service;

import static com.threego.app.common.util.JdbcTemplate.close;
import static com.threego.app.common.util.JdbcTemplate.commit;
import static com.threego.app.common.util.JdbcTemplate.getConnection;
import static com.threego.app.common.util.JdbcTemplate.rollback;

import java.sql.Connection;

import com.threego.app.rider.model.dao.RiderDao;
import com.threego.app.rider.model.vo.Rider;

public class RiderService {

	private final RiderDao riderDao = new RiderDao();

	public int insertRider(Rider rider) {
		int result =0;
		Connection conn = getConnection();
		try {
			result = riderDao.insertRider(conn,rider);
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
