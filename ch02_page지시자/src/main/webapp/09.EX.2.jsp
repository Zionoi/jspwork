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
	String blood_type = request.getParameter("blood_type");
	String name = request.getParameter("name");
	
	switch(blood_type){
	case "A" : %>
		<jsp:forward page="09.1.A.jsp"/>
		<%break;
	case "B" :%>
		<jsp:forward page="09.2.B.jsp"/>
		<%break;
	case "O" :%>
		<jsp:forward page="09.3.O.jsp"/>
		<%break;
	case "AB" :%>
		<jsp:forward page="09.4.AB.jsp"/>
	<%
	}	
	

%>
</body>
</html>