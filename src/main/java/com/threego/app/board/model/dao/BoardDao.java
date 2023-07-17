package com.threego.app.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.threego.app.admin.model.dao.AdminDao;
import com.threego.app.board.model.exception.BoardException;
import com.threego.app.board.model.vo.Board;
import com.threego.app.board.model.vo.BoardType;

public class BoardDao {

private Properties prop = new Properties();
	
	public BoardDao() {
		String filename = 
			BoardDao.class.getResource("/sql/admin/board-query.properties").getPath();
		try {
			prop.load(new FileReader(filename));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public List<Board> findAllBoards(Connection conn, int start, int end) {
		List<Board> boards = new ArrayList<>();
		String sql = prop.getProperty("findAllBoards");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Board board = handleBoardResultSet(rset);
					boards.add(board);
				}
			}
		}catch(SQLException e) {
			throw new BoardException(e);
		}
		return boards;
	}

	private Board handleBoardResultSet(ResultSet rset) throws SQLException {
		Board board = new Board();
		board.setBoardNo(rset.getInt("b_no"));
		BoardType boardType = BoardType.valueOf(rset.getString("b_type"));
		board.setBoardType(boardType);
		board.setBoardTitle(rset.getString("b_tittle"));
		board.setBoardWriter(rset.getString("b_writer"));
		board.setBoardContent(rset.getString("b_content"));
		board.setBoardRegDate(rset.getDate("b_reg_date"));
		board.setBoardCnt(rset.getInt("b_cnt"));
		return board;
	}
	
	
}
