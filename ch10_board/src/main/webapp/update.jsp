<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String nowPage = request.getParameter("nowPage");
	Board board = (Board)session.getAttribute("bean");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script>

    </script>
</head>
<body>
	<form action="boardUpdate" method="post">
		<table align="center">
			<tr>
				<th colspan="4">수정하기</th>
			</tr>
				<td colspan="2"><br></td>
			<tr>
			</tr>
			<tr>
				<td class="listTd">성 명</td>
				<td><input name="name" value="<%=board.getName() %>"></td>
			</tr>
			<tr>
				<td class="listTd">제 목</td>
				<td colspan="2"><input name="subject" id="title" value="<%=board.getSubject() %>"></td>
			</tr>
			<tr>
				<td class="listTd">내 용</td>
				<td colspan="2"><input name="content" id="content" value="<%=board.getContent() %>"></td>
			</tr>
			<tr>
				<td class="listTd">비밀 번호</td>
				<td><input type="password" name="pass" required></td>
			</tr>
			<tr class="underLine">
				<td colspan="4">
					<input type="submit" value="수정완료">
					<input type="reset" value="다시수정">
					<input type="button" value="뒤로" onclick="history.go(-1);">
				</td>
			</tr>
		</table>
		<input type="hidden" name="num" value="<%=num %>">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
	</form>
</body>
</html>