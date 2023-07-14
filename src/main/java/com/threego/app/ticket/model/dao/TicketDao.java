package com.threego.app.ticket.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.threego.app.ticket.model.exception.TicketException;
import com.threego.app.ticket.model.vo.Ticket;

public class TicketDao {
	
	private Properties prop = new Properties();
	
	public TicketDao() {
		String filename = 
				TicketDao.class.getResource("/sql/ticket/ticket-query.properties").getPath();
			try {
				prop.load(new FileReader(filename));
			} catch (IOException e) {
				e.printStackTrace();
			}
	}


	public List<Ticket> findTicket(Connection conn) {
		List<Ticket> tickets = new ArrayList<>();
		String sql = prop.getProperty("findTicket");
		
		try ( PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rset = pstmt.executeQuery();
			) {
			while(rset.next()) {
				Ticket ticket = handleTicketResultSet(rset);
				tickets.add(ticket);
			}
		} catch (SQLException e) {
			throw new TicketException(e);
		}
		return tickets;
	}


	private Ticket handleTicketResultSet(ResultSet rset) throws SQLException{
		Ticket ticket = new Ticket();
		ticket.setTic_id(rset.getString("tic_id"));
		ticket.setTic_name(rset.getString("tic_name"));
		ticket.setTic_cnt(rset.getInt("tic_cnt"));
		ticket.setTic_price(rset.getInt("tic_price"));
		
		return ticket;
	}

}
