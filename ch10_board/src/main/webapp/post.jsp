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
	table td {text-align:center; height:30px;}
	.col {background-color: #E8D9FF;}
	.col2 {background-color: #F6F6F6;}
	a {text-decoration:none; color:black;}
	.underLine>td {border-top:1px solid;}
</style>
</head>
<body>
	<form action="">
		<table>
			<tr>
				<th colspan="4">글쓰기</th>
			</tr>
			<tr>
			</tr>
			<tr>
				<td>성 명</td>
				<td><input name="name"></td>
			</tr>
			<tr>
				<td>제 목</td>
				<td colspan="2"><input name="title"></td>
			</tr>
			<tr>
				<td>내 용</td>
				<td colspan="2"><input name="content"></td>
			</tr>
			<tr>
				<td>비밀 번호</td>
				<td><input type="password"></td>
			</tr>
			<tr class="underLine">
				<td colspan="4">
					<input type="button" value="등록">
					<input type="button" value="다시쓰기">
					<input type="button" value="리스트">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>