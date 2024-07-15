<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>while_2</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	String msg = request.getParameter("msg");
	int count = Integer.parseInt(request.getParameter("count")); //html에서 넘어오는값은 넘버여도 무조건 스트링임
	int num = 0;
	while(count > num){
%>
		<%=msg%>

<%		num++;
	}
	%>

</body>
</html>