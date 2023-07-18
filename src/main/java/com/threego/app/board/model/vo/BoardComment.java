package com.threego.app.board.model.vo;

import java.sql.Date;

public class BoardComment {
	private int c_no;
	private int c_level;
	private String c_writer;
	private String c_content;
	private int c_board_no;
	private Date c_reg_date;
	
	public BoardComment() {
		// TODO Auto-generated constructor stub
	}

	public BoardComment(String c_writer, String c_content, int c_boardNo) {
		super();
		this.c_writer = c_writer;
		this.c_content = c_content;
		this.c_board_no = c_boardNo;
	}

	

	public BoardComment(int c_no, int c_level, String c_writer, String c_content, int c_board_no, Date c_reg_date) {
		super();
		this.c_no = c_no;
		this.c_level = c_level;
		this.c_writer = c_writer;
		this.c_content = c_content;
		this.c_board_no = c_board_no;
		this.c_reg_date = c_reg_date;
	}

	public int getC_no() {
		return c_no;
	}

	public void setC_no(int c_no) {
		this.c_no = c_no;
	}

	public int getC_level() {
		return c_level;
	}

	public void setC_level(int c_level) {
		this.c_level = c_level;
	}

	public String getC_writer() {
		return c_writer;
	}

	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public int getC_board_no() {
		return c_board_no;
	}

	public void setC_board_no(int c_board_no) {
		this.c_board_no = c_board_no;
	}

	public Date getC_reg_date() {
		return c_reg_date;
	}

	public void setC_reg_date(Date c_reg_date) {
		this.c_reg_date = c_reg_date;
	}

	@Override
	public String toString() {
		return "BoardComment [c_no=" + c_no + ", c_level=" + c_level + ", c_writer=" + c_writer + ", c_content="
				+ c_content + ", c_board_no=" + c_board_no + ", c_reg_date=" + c_reg_date + "]";
	}
	
	
	
}
