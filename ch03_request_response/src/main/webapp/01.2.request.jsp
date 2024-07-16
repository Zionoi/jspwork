<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");
	String sNum = request.getParameter("studentNum");
	String gender = request.getParameter("gender");
	String major = request.getParameter("major");
	String[] hobby = request.getParameterValues("hobby");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	  이름 : <%=name %><br>
	  학번 : <%=sNum %><br>
	  성별 : <%=gender%><br>
	  전공 : <%=major%><br>
	  취미 : 
	<%	for(int i=0; i<hobby.length;i++){
		out.print(hobby[i]+(i!=hobby.length-1 ? ", " : ""));
		}
	%>

</body>
</html>