<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{text-align:center;}
	table{
		border:1px solid;
	}
	tr, th, td{
		border: 1px solid;
	}
</style>
</head>
<body>
	<div>
		<h2>투표프로그램</h2>
		<hr>
		
		<h5>설문작성</h5>
		<hr>
		<form action="voteInsertProc.jsp" method="post">
			<table>
				<tr>
					<th>질문</th>
					<td colspan="2">q: <input type="text" name="question" size="57"></td>
				</tr>
				<tr>
					<th rowspan="8">항목</th>
					<%
						for(int i=1;i<=4;i++){
							out.print("<td>"+ (i*2-1) + ":<input name='item'></td>");
							out.print("<td>"+ i*2 + ":<input name='item'></td>");
							out.print("</tr>");
							if(i<4)
							out.print("<tr>");
						}
					%>
				<!-- 
					
					<td>1:<input name="item"></td>
					<td>2:<input name="item"></td>
				</tr>
				<tr>
					<td>3:<input name="item"></td>
					<td>4:<input name="item"></td>
				</tr>
				<tr>
					<td>5:<input name="item"></td>
					<td>6:<input name="item"></td>
				</tr>
				<tr>
					<td>7:<input name="item"></td>
					<td>8:<input name="item"></td>
				</tr>
				 -->
				<tr>
					<td>시작일</td>
					<td>
						<select name="sdateY">
							<%
								for(int i=2024;i<=2040;i++){
									out.print("<option value='"+ i + "'>" + i);
								}
							%>
						</select>년
						<select name="sdateM">
							<%
								for(int i=1;i<=12;i++){
									out.print("<option value='"+ i + "'>" + i);
								}
							%>
						</select>월
						<select name="sdateD">
							<%
								for(int i=1;i<=31;i++){
									out.print("<option value='"+ i + "'>" + i);
								}
							%>
						</select>일
					</td>
				</tr>
				<tr>
					<td>종료일</td>
					<td>
						<select name="edateY">
							<%
								for(int i=2024;i<=2040;i++){
									out.print("<option value='"+ i + "'>" + i);
								}
							%>
						</select>년
						<select name="edateM">
							<%
								for(int i=1;i<=12;i++){
									out.print("<option value='"+ i + "'>" + i);
								}
							%>
						</select>월
						<select name="edateD">
							<%
								for(int i=1;i<=31;i++){
									out.print("<option value='"+ i + "'>" + i);
								}
							%>
						</select>일
						</td>
				</tr>
				<tr>
					<td>이중답변</td>
					<td>
						<input type="radio" name="type" value="1" checked>yes&emsp;
					 	<input type="radio" name="type" value="0">no
					</td>
				</tr>
				<tr>
					
					<td colspan="2" align="center">
						<input type="submit" value="작성하기">
						<input type="reset" value="초기화">
						<input type="button" value="리스트보기">
					</td>
				</tr>
			</table>
		</form>
	</div>

</body>
</html>