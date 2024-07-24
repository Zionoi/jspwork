<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div>
	<h1>춘대학교</h1>
</div>
<%
	String id = (String)session.getAttribute("idKey");
	if(id == null){
%>
<body>
	<form action="LoginServlet" method="post">
		<table>
			<tr>
				<th>ID : </th>
				<td><input name="id"></td>
				<td rowspan="4;"><input type="submit" value="로그인" style=" height: 48px"></td>
			</tr>
			<tr>
				<th>PW : </th>
				<td><input type="password" name="pw"></td>
			</tr>
		</table>
	</form>
<%
	}else{
%>
	<form action="LoginServlet" method="post">
		<table>
			<tr>
				<th>ID : </th>
				<td><input name="id"></td>
				<td rowspan="4;"><input type="submit" value="로그인" style=" height: 48px"></td>
			</tr>
			<tr>
				<th>PW : </th>
				<td><input type="password" name="pw"></td>
			</tr>
		</table>
	</form>
<%
	}
%>
</body>
</html>