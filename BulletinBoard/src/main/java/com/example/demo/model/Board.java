package com.example.demo.model;

import java.util.Date;

import lombok.Data;

@Data
public class Board {
	private int boardNo;             // 게시글 번호
    private String boardTitle;       // 제목
    private String boardContent;     // 내용
    private String boardWriter;      // 작성자
    private int count;               // 조회수
    private Date createDate;         // 생성 날짜
    private String status;           // 상태 ('Y' 또는 'N')
}
