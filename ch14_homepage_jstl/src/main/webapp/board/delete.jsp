<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	Board board = (Board)session.getAttribute("bean");
	if(request.getParameter("pass") != null){
		String inputPass = request.getParameter("pass");
		String dbPass = board.getPass();
	System.out.println(inputPass + dbPass);
		
		if(inputPass.equals(dbPass)){
			boolean result = bDao.deleteBoard(num);
			if(result)
				response.sendRedirect("list.jsp?nowPage="+nowPage);
		}else{
%>
			<script>
				alert("비밀번호가 맞지 않습니다");
				history.back();
			</script>
<%			
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	* {margin: 0 auto;}
	table {margin-top: 50px; width:800px; }
	table th {height:40px; background-color: #B778FF;}
	table>td {text-align:center; height:30px;}
	.listTd{text-align: center;}
	.col {background-color: #E8D9FF;}
	.col2 {background-color: #F6F6F6;}
	a {text-decoration:none; color:black;}
	.underLine>td {border-top:1px solid;}
	#content{
		width: 500px;
		height: 400px;
	}
	#title {
		width: 500px;
	}
	
</style>
<body>
	<!-- <form action="deleteBoard" method="post"> -->
	<form action="delete.jsp" method="get"> <!-- 나 자신을 호출할땐 get방식으로 보내야 주소표시줄에 넘겨준 값들이 표시됨 -->
		<table align="center">
			<tr>
				<th>사용자의 비밀번호를 입력하세요</th>
			</tr>
			<tr>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr class="underLine">
				<td colspan="4">
					<input type="submit" value="삭제완료">
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로" onclick="history.go(-1);">
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">

		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>

</body>
</html>