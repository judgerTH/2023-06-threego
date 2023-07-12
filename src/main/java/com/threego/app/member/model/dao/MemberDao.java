package com.threego.app.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.threego.app.member.model.exception.MemberException;
import com.threego.app.member.model.vo.Member;
import com.threego.app.member.model.vo.MemberRole;

public class MemberDao {
	
	Properties prop = new Properties();
	
	public MemberDao() {
		
		String filename = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Member findById(Connection conn, String id) {
		
		Member member = null;
		String sql = prop.getProperty("findById");
		// select * from member where id = ?
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)){
			pstmt.setString(1, id);
			
			try(ResultSet rset = pstmt.executeQuery()){
				
				while(rset.next()) {
					
					member = handleMemberResultSet(rset);
					
				}
				
			}
			
		} catch (SQLException e) {
			
			throw new MemberException(e);
		}
		
		return member;
	}

	private Member handleMemberResultSet(ResultSet rset) throws SQLException {
		Member member;
		String member_id = rset.getString("id");
		String pwd = rset.getString("pwd");
		String name = rset.getString("name");
		String email = rset.getString("email");
		String phone = rset.getString("phone");
		MemberRole member_role = MemberRole.valueOf(rset.getString("member_role"));
		String post = rset.getString("post");
		String address = rset.getString("address");
		Date regDate = rset.getDate("reg_date");
	 
		return new Member(member_id, pwd, name, email, phone, member_role, post, address, regDate);
	}
	
	

}
