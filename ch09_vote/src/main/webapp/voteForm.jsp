<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch09.*, java.util.*" %>
<jsp:useBean id="vDao" class="ch09.VoteDao"/>

<%
	int num = 0;
	// 페이지가 처음 켜질때엔 request.getParameter로 전달받은 값이 없어서 에러가 뜸. if문으로 걸러주기
	if(!(request.getParameter("num")==null||request.getParameter("num").equals(""))){
		num =Integer.parseInt(request.getParameter("num"));
	}
	
	VoteList vlist = vDao.getOneVote(num);
	ArrayList<String> vItem = vDao.getItem(num);
	
	String question = vlist.getQuestion();
	int type = vlist.getType();
%>
<!DOCTYPE html>
<html>
<style>
	div{text-align:center;}
/* 	table{
		border:1px solid;
	}
	tr, th, td{
		border: 1px solid;
	} */
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h5>설문폼</h5>
		<form action="voteFormProc.jsp" method="post">
				<table>
					<tr>
						<td >Q:<%=question %> </td>
					</tr>
					<tr>
						<td>
						<%
							for(int i=0;i<vItem.size();i++){
								String itemList = vItem.get(i);
								if(type == 1) {
									out.print("<input type='checkbox' name='itemnum' value='" + i + "' >" + itemList);
								}else {
									out.print("<input type='radio' name='itemnum' value='" + i + "' >" + itemList);
								}
								out.print("<br>");
							}
						%>		
						</td>		
					</tr>
					<tr>
						<td>
							<input type="submit" value="투 표"> &emsp;
							<input type="button" value="결 과" 
							onclick="window.open('voteView.jsp?num=<%=num%>', 'voteView', 'width=500, height=350')">
						</td>
					</tr>
				</table>
				<input type="hidden" name="num" value="<%=num %>">
	</div>
</body>
</html>