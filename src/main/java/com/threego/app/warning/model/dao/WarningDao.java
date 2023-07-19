package com.threego.app.warning.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.threego.app.member.model.dao.MemberDao;
import com.threego.app.warning.model.exception.WarningException;
import com.threego.app.warning.model.vo.Warning;

public class WarningDao {
	Properties prop = new Properties();
	public WarningDao() {

		String filename = MemberDao.class.getResource("/sql/warning/warning-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public int insertWarning(Connection conn, Warning warning) {
		int result=0;
		String sql = prop.getProperty("insertWarning");
		// insert Warning = insert into warning values(seq_w_no.nextval,?,?,?,default, default, null)
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setInt(1, warning.getWarningReqNo());
			pstmt.setString(2, warning.getWarningWriter());
			pstmt.setString(3, warning.getWarningContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new WarningException(e);
		}
		
		return result;
	}

}
