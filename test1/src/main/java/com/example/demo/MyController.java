package com.example.demo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MyController {
	
	@RequestMapping("/")
	//@ResponseBody
	public String root() {
		//return "root()함수 호출됨."; // 문자열로 반환
		return "redirect:listForm"; // listForm"으로
	}
	
	@RequestMapping("/listForm")
	public String listForm() {
		
		return "listForm";
	}

}
