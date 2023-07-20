package com.threego.app.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.threego.app.board.model.exception.BoardException;
import com.threego.app.board.model.vo.Board;
import com.threego.app.board.model.vo.BoardComment;
import com.threego.app.board.model.vo.BoardType;

public class BoardDao {

private Properties prop = new Properties();
	
	public BoardDao() {
		String filename = 
			BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
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
		return board;
	}

	public List<Board> findAll(Connection conn, int start, int end) {
		List<Board> boards = new ArrayList<>();
		String sql = prop.getProperty("findAll");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					Board board = handleBoardResultSet(rset);
					boards.add(board);
				}
			}
		} catch (SQLException e) {
			throw new BoardException(e);
		}
		return boards;
	}

	public int getTotalContent(Connection conn) {
		int totalContent = 0;
		String sql = prop.getProperty("getTotalContent"); // select count(*) from board
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				while(rset.next())
					totalContent = rset.getInt(1);
			}
		} catch (SQLException e) {
			throw new BoardException(e);
		}
		return totalContent;
	}

	public int insertBoard(Connection conn, Board board) {
		int result = 0;
		String sql = prop.getProperty("insertBoard");
		//insertBoard = insert into board values (seq_board_no.nextval,'Q',?,?,?,default)
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardWriter());
			pstmt.setString(3, board.getBoardContent());
			
			result = pstmt.executeUpdate(); 
		} catch (SQLException e) {
			
			throw new BoardException(e);
		}
		
		return result;
	}

	public int getLastBoardNo(Connection conn) {
		int boardNo = 0;
		String sql = prop.getProperty("getLastBoardNo");
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			try (ResultSet rset = pstmt.executeQuery()) {
				if(rset.next()) {
					boardNo = rset.getInt(1);
				}
			}
		} catch (SQLException e) {
			throw new BoardException(e);
		}
		
		return boardNo;
	}

	public Board findByNo(Connection conn, int no) {
		Board board = null;
		String sql = prop.getProperty("findByNo");
		
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, no);
			try (ResultSet rset = pstmt.executeQuery()) {
				if (rset.next())
					board = handleBoardResultSet(rset);
			}
		} catch (SQLException e) {
			throw new BoardException(e);
		}
		return board;
	}

	public int updateBoard(Connection conn, Board board) {
		int result = 0;
		String query = prop.getProperty("updateBoard");
		//update board set b_tittle = ?, b_content = ? where b_no = ?

		try (PreparedStatement pstmt = conn.prepareStatement(query)) {
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setInt(3, board.getBoardNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			throw new BoardException(e);
		} 
		return result;
	}

	public int deleteBoard(Connection conn, int no) {
		int result = 0;
		String sql = prop.getProperty("deleteBoard");
		//delete Board = delete board where b_no = ?

		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1,no );
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
//			e.printStackTrace();
			throw new BoardException(e);
		} 
		return result;
	}

	public int commentCreate(Connection conn, BoardComment boardComment) {
		int result = 0;
		String sql = prop.getProperty("commentCreate");
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setString(1, boardComment.getC_writer());
			pstmt.setString(2, boardComment.getC_content());
			pstmt.setInt(3, boardComment.getC_board_no());
			
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			throw new BoardException(e);
		}
		return result;
	}

	public List<BoardComment> findAllComentByBoardNo(Connection conn, int boardNo) {
		List<BoardComment> boardComments = new ArrayList<BoardComment>();
		String sql = prop.getProperty("findAllComentByBoardNo");
		
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			pstmt.setInt(1, boardNo);
			try(ResultSet rset = pstmt.executeQuery()) {
				while(rset.next()) {
					BoardComment boardComment = handleBoardCommentResultSet(rset);
					boardComments.add(boardComment);
				}
			}
		}catch(SQLException e) {
			throw new BoardException(e);
		}
		return boardComments;
	}

	private BoardComment handleBoardCommentResultSet(ResultSet rset) throws SQLException {
		int c_no = rset.getInt("c_no");
		int c_level = rset.getInt("c_level");
		String c_writer = rset.getString("c_writer");
		String c_content = rset.getString("c_content");
		int c_board_no = rset.getInt("c_board_no");
		Date c_reg_date = rset.getDate("c_reg_date");
		
		return new BoardComment(c_no, c_level, c_writer, c_content, c_board_no, c_reg_date);
		
	}

	
	
}
