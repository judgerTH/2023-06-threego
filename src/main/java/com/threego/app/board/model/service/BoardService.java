package com.threego.app.board.model.service;

import static com.threego.app.common.util.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.threego.app.board.model.dao.BoardDao;
import com.threego.app.board.model.vo.Board;

public class BoardService {

	private final BoardDao boardDao = new BoardDao();

	public List<Board> findAllBoards(int start, int end) {
		Connection conn = getConnection();
		List<Board> boards = boardDao.findAllBoards(conn, start, end);
		close(conn);
		return boards;
	}
	
	
}
