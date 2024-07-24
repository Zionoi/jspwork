<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>
	<form action="boardPost" method="post">
		<table align="center">
			<tr>
				<th colspan="4">글쓰기</th>
			</tr>
				<td colspan="2"><br></td>
			<tr>
			</tr>
			<tr>
				<td class="listTd">성 명</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td class="listTd">제 목</td>
				<td colspan="2"><input name="subject" id="title"></td>
			</tr>
			<tr>
				<td class="listTd">내 용</td>
				<td colspan="2"><input name="content" id="content"></td>
			</tr>
			<tr>
				<td class="listTd">비밀 번호</td>
				<td><input type="password" name="pass" required></td>
			</tr>
			<tr class="underLine">
				<td colspan="4">
					<input type="submit" value="등록">
					<input type="reset" value="다시쓰기">
					<input type="button" value="리스트" onclick="location.href='list.jsp'">
				</td>
			</tr>
		</table>
		<input type="hidden" name="ip" value="<%=request.getRemoteAddr() %>">
	</form>
</body>
</html>