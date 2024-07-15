<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello</title>
</head>
<body>
	jsp 처음시작
	<% String name = "홍길동"; %>
	<%= name %>
	
	<!-- html 주석  -->
	<%-- jsp 주석(html과 jsp가 혼재되어 있을 때 사용)
		선언문 : 메소드 생성 및 멤버변수 생성시
		<$! 프로그램 $>
	--%>
	<%!
		// jsp안에서의 주석
		// 한줄 주석
		/*
			여러줄 주석
		*/
		
	%>
</body>
</html>