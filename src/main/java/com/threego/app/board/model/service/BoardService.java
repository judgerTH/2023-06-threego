package com.threego.app.board.model.service;

import static com.threego.app.common.util.JdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import com.threego.app.board.model.dao.BoardDao;
import com.threego.app.board.model.vo.Board;
import com.threego.app.board.model.vo.BoardComment;

public class BoardService {

	private final BoardDao boardDao = new BoardDao();

	public List<Board> findAllBoards(int start, int end) {
		Connection conn = getConnection();
		List<Board> boards = boardDao.findAllBoards(conn, start, end);
		close(conn);
		return boards;
	}

	public List<Board> findAll(int start, int end) {
		Connection conn = getConnection();
		List<Board> boards = boardDao.findAll(conn, start, end);
		close(conn);
		return boards;
	}

	public int getTotalContent() {
		Connection conn = getConnection();
		int totalContent = boardDao.getTotalContent(conn);
		close(conn);
		return totalContent;
	}

	public int insertBoard(Board board) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.insertBoard(conn, board);
			int boardNo = boardDao.getLastBoardNo(conn);
			board.setBoardNo(boardNo);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}


	public Board findByNo(int no) {
		Connection conn = getConnection();
		Board board = boardDao.findByNo(conn, no);
		close(conn);
		return board;
	}

	public int updateBoard(Board board) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.updateBoard(conn, board);
			commit(conn);
		}catch (Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}

	public int deleteBoard(int no) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = boardDao.deleteBoard(conn, no);
			commit(conn);
		}catch (Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}

	public int commentCreate(BoardComment boardComment) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = boardDao.commentCreate(conn, boardComment);
			commit(conn);
		}catch(Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}

	public List<BoardComment> findAllComentByBoardNo(int boardNo) {
		Connection conn = getConnection();
		List<BoardComment> boardComments = boardDao.findAllComentByBoardNo(conn, boardNo);
		close(conn);
		return boardComments;
	}
}
