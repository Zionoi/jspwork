package com.example.demo.model;

import lombok.Data;
import java.time.LocalDateTime;

@Data
public class Board {
    private int board_no;             // 게시글 번호
    private String board_title;       // 제목
    private String board_content;     // 내용
    private String board_writer;      // 작성자
    private int count;                // 조회수
    private LocalDateTime create_date; // 생성 날짜
    private String status;            // 상태 ('Y' 또는 'N')
}
