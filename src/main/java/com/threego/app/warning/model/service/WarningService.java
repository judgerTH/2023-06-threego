package com.threego.app.warning.model.service;

import static com.threego.app.common.util.JdbcTemplate.close;
import static com.threego.app.common.util.JdbcTemplate.commit;
import static com.threego.app.common.util.JdbcTemplate.getConnection;
import static com.threego.app.common.util.JdbcTemplate.rollback;

import java.sql.Connection;

import com.threego.app.warning.model.dao.WarningDao;
import com.threego.app.warning.model.vo.Warning;

public class WarningService {
	private final WarningDao warningDao = new WarningDao();

	public int insertWarning(Warning warning) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = warningDao.insertWarning(conn,warning);
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

