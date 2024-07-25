<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
	if(id==null){
%>
	<script>
	alert("로그안 안됨")
	location.href="hh.jsp";
	</script>
<%
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Cookie 로그인</h2>
	<h3><%=id %>님이 로그인 하였습니다</h3>
	<h3><a href="Logout.jsp">로그아웃</a>

</body>
</html>