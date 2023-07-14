package com.threego.app.ticket.model.service;

import java.sql.Connection;
import java.util.List;

import com.threego.app.ticket.model.dao.TicketDao;
import com.threego.app.ticket.model.vo.Ticket;
import static com.threego.app.common.util.JdbcTemplate.*;

public class TicketService {
	
	private final TicketDao ticketDao = new TicketDao();

	public List<Ticket> findTicket() {
		Connection conn = getConnection();
		List<Ticket> tickets = ticketDao.findTicket(conn);
		return tickets;
	}
	
}
