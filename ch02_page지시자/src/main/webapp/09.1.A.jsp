<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	String blood_type = request.getParameter("blood_type");
	String name = request.getParameter("name");
%>	
<h1>a형</h1>
<%=name %>님의 혈액형은 <%=blood_type %>이고 성격은
소심, 꼼꼼, 내성적
</body>
</html>