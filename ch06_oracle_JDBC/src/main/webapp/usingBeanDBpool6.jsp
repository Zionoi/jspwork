<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ch06.*" %>
<jsp:useBean id="pool" class="ch06.UseBeanDBPool6" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bean과 DBConnectionPool</title>
</head>
<body>
	<h1>Bean과 DBConnectionPool을 이용한 oracle연동</h1>
	<table>
		<tr>
			<th>사번</th>
			<th>사원명</th>
			<th>부서명</th>
		</tr>
		<%
			ArrayList<Bean> alist = pool.getList();
			for(int i=0; i<alist.size();i++){
				Bean bean = alist.get(i);
		%>
			<tr>
				<td><%=bean.getEMP_ID() %></td>
				<td><%=bean.getEMP_NAME() %></td>
				<td><%=bean.getDEPT_CODE() %></td>
			</tr>
		<%		
			}
		
		%>	
	</table>
</body>
</html>