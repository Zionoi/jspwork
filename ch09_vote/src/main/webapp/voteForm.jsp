<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch09.*, java.util.*" %>
<jsp:useBean id="vDao" class="ch09.VoteDao"/>

<%
	VoteList vlist = vDao.getOneVote(25);
	ArrayList<String> vItem = vDao.getItem(25);
	
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
							<input type="button" value="결 과">
						</td>
					</tr>
				</table>
	</div>
</body>
</html>