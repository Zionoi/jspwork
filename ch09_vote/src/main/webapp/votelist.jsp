<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, ch09.*" %>
<jsp:useBean id="vDao" class="ch09.VoteDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		text-align: center;
	}
	div {
		border: 1px solid black;
		width: 800px;
		margin: 0 auto;
		padding: 20px;
	}
	table {
		border: 1px solid black;
		margin: 20px auto;
		border-collapse: collapse;
		width: 100%;
	}
	td, th {
		border: 1px solid black;
		padding: 8px;
/* 		text-align: center; */
	}
	input[type="button"] {
		margin-top: 10px;
	}
</style>
</head>
<body>
	<div>
		<h2>투표프로그램</h2>
		<hr>
		<!--인클루드해서 해당 페이지 연동  -->
		<jsp:include page="voteForm.jsp"/>
		<hr>
		<h2>설문리스트</h2>
		<table>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>시작일~종료일</th>
			</tr>
			<%
				ArrayList<VoteList> alist = vDao.getList();
			
				for(int i=0; i<alist.size();i++){
					VoteList vlist = alist.get(i);
			%>		
				<tr>
					<td> <%=vlist.getNum() %></td>
					<td> <a href="votelist.jsp?num=<%=vlist.getNum()%>"><%=vlist.getQuestion() %></a></td>
					<td> <%=vlist.getSdate().substring(0, 10) %> ~ <%=vlist.getEdate().substring(0, 10) %></td>
				</tr>
			<%
				}
			%>
			<tr>
				<td colspan="3" text-align="right">설문 작성하기</td>
			</tr>
		</table>
		
	</div>
</body>
</html>
