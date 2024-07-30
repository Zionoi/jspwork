<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*" %>
<%
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
	<form action="boardReply" method="post">
		<table align="center">
			<tr>
				<th colspan="4">댓 글 등 록</th>
			</tr>
				<td colspan="2"><br></td>
			<tr>
			</tr>
			<tr>
				<td class="listTd">성 명</td>
				<td><input name="name" required></td>
			</tr>
			<tr>
				<td class="listTd">제 목</td>
				<td colspan="2"><input name="subject" id="title" value="답변 : <%=board.getSubject() %>"></td>
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
					<input type="submit" value="답변등록">
					<input type="reset" value="다시쓰기">
					<input type="button" value="뒤로" onclick="history.go(-1);">
				</td>
			</tr>
		</table>
		<!-- 앞에서 넘어온 값 -->
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<!-- 댓글을 쓰는 작성자의 ip -->
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
		<!-- 댓글을 쓰는 부모의 정보 -->
		<input type="hidden" name="ref" value="<%=board.getRef() %>">
		<input type="hidden" name="pos" value="<%=board.getPos() %>">
		<input type="hidden" name="depth" value="<%=board.getDepth() %>">
		
		
	</form>
</body>
</html>