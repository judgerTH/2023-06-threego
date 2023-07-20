package com.threego.app.board.model.vo;

import java.sql.Date;

/**
 * 
 * @유성근
 *
 */
public class Board {
	
	private int boardNo;
	private BoardType boardType;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private Date boardRegDate;

	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Board(int boardNo, BoardType boardType, String boardTitle, String boardWriter, String boardContent,
			Date boardRegDate) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
		this.boardRegDate = boardRegDate;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public BoardType getBoardType() {
		return boardType;
	}


	public void setBoardType(BoardType boardType) {
		this.boardType = boardType;
	}


	public String getBoardTitle() {
		return boardTitle;
	}


	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}


	public String getBoardWriter() {
		return boardWriter;
	}


	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}


	public String getBoardContent() {
		return boardContent;
	}


	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}


	public Date getBoardRegDate() {
		return boardRegDate;
	}


	public void setBoardRegDate(Date boardRegDate) {
		this.boardRegDate = boardRegDate;
	}

	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", boardTitle=" + boardTitle
				+ ", boardWriter=" + boardWriter + ", boardContent=" + boardContent + ", boardRegDate=" + boardRegDate
				+ "]";
	}

	
	
	
	
}
