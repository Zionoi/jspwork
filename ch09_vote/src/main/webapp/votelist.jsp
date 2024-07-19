<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		text-align: center;
	}
	div {
		border: 1px solid black;
		width: 800px;
		margin: 0 auto;
		padding: 20px;
	}
	table {
		border: 1px solid black;
		margin: 20px auto;
		border-collapse: collapse;
		width: 100%;
	}
	td, th {
		border: 1px solid black;
		padding: 8px;
/* 		text-align: center; */
	}
	input[type="button"] {
		margin-top: 10px;
	}
</style>
</head>
<body>
	<div>
		<h2>투표프로그램</h2>
		<hr>
		<form name="frm" class="voteForm">
			<h2>설문폼</h2>
			<table>
				<tr>
					<td colspan="2">Q : null</td>
				</tr>
				<tr>
					<td></td>
				</tr>
				<tr>
					<td>투표</td>
					<td><input type="button" name="result" value="결과"></td>
				</tr>
			</table>
		</form>
		<hr>
		<h2>설문리스트</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일~종료일</th>
			</tr>
			<tr>
				<td colspan="3" text-align="right">설문 작성하기</td>
			</tr>
		</table>
		
	</div>
</body>
</html>
