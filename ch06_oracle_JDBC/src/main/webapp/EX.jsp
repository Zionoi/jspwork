<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ch06.*" %>
<jsp:useBean id="ExP" class="ch06.EXPool" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>연습문제</h1>
	<table border="1">
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>이메일</th>
			<th>전화번호</th>
			<th>직급명</th>
		</tr>
		<%
		ArrayList<Bean> alist = ExP.getList();
		for(int i=0; i<alist.size();i++){
			Bean bean = alist.get(i);
		%>
		<tr>
			<td><%=bean.getEMP_ID() %></td>
			<td><%=bean.getEMP_NAME() %></td>
			<td><%=bean.getEMAIL() %></td>
			<td><%=bean.getPHONE() %></td>
			<td><%=bean.getJOB_NAME() %></td>
		</tr>
		<%		
			}
		
		%>
	</table>
</body>
</html>