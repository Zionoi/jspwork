<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ch06.*" %>
<jsp:useBean id="ex2" class="ch06.EX2" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>연습</h1>
	<table border="1">
		<tr>
			<th>TCODE</th>
			<th>PCODE</th>
			<th>TDATE</th>
			<th>STOCK_COUNT</th>
			<th>STOCK_PRICE</th>
		</tr>
<%
	ArrayList<EXBean> alist = ex2.getList();
		for(int i=0; i<alist.size();i++){
			EXBean exb = alist.get(i);
%>

			<tr>
			<th><%=exb.getTCODE() %></th>
			<th><%=exb.getPCODE() %></th>
			<th><%=exb.getTDATE() %></th>
			<th><%=exb.getSTOCK_COUNT() %></th>
			<th><%=exb.getSTOCK_PRICE() %></th>
		</tr>
<%
		}

%>
		
		
</body>
</html>