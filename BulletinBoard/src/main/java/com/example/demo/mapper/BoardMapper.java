package com.example.demo.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.model.Board;

@Mapper
public interface BoardMapper {
	// 게시글 전체 조회
	List<Board> findAll();
	
	// 게시글 단건 조회
	Board findById(int id);
	
	// 게시글 삽입
	void insert(Board board);
	
	// 게시글 수정
	void update(Board board);
	
	// 게시글 삭제
	void delete(int id);
}
