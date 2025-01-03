package com.example.demo.dto;

import lombok.Data;

// lombok 연결
@Data
public class BoardDto {
	private int board_no;
	private String board_title;
	private String board_content;
	private String board_writer;
	private int count;
	private char status;
	
	public BoardDto() {
		
	}
	
	public BoardDto(int board_no, String board_title, String board_content, String board_writer, int count,
			char status) {
		super();
		this.board_no = board_no;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_writer = board_writer;
		this.count = count;
		this.status = status;
	}
	
	
}
