package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.mapper.BoardMapper;
import com.example.demo.model.Board;

@Controller
@RequestMapping("/boards")
public class BoardController {
	
	@Autowired
	private BoardMapper boardMapper;
	
	//게시글 목록
	@GetMapping("/list")
	public String list(Model model) {
		List<Board> boards = boardMapper.findAll();
		System.out.println("전체게시판 컨트롤러 메소드 확인 : "+boards.toString());
		model.addAttribute("boards", boards);
		return "boards/list";
	}
	
	// 게시글 작성 폼
	@GetMapping("/new")
	public String newBoardForm(Model model) {
		model.addAttribute("board", new Board());
		return "boards/newBoard";
	}
	
	// 게시글 저장
	@PostMapping
	public String saveBoard(@ModelAttribute Board board) {
		boardMapper.insert(board);
		return "redirect:/boards/list";
	}
	
	// 게시글 상세보기
	@GetMapping("/{boardNo}")
	public String viewBoard(@PathVariable("boardNo") int boardNo, Model model) {
		Board board = boardMapper.findById(boardNo);
		model.addAttribute("board", board);
		return "/boards/detailboard";
	}
	
	// 게시글 수정 폼
	@GetMapping("{boardNo}/edit")
	public String editBoardForm(@PathVariable("boardNo") int boardNo, Model model) {
		Board board = boardMapper.findById(boardNo);
		model.addAttribute("board", board);
		System.out.println("수정폼 확인 : "+board.toString());
		return "boards/edit";
	}
	
	// 게시글 업데이트
	@PostMapping("/{boardNo}")
	public String updateBoard(@PathVariable("boardNo") int boardNo, @ModelAttribute Board board) {
		board.setBoardNo(boardNo);
		boardMapper.update(board);
		return "redirect:/boards/" + boardNo;
	}
	
	// 게시글 삭제
	@PostMapping("{boardNo}/delete")
	public String deleteBoard(@PathVariable("boardNo") int boardNo) {
		boardMapper.delete(boardNo);
		return "redirect:/boards/list";
	}
	
}
