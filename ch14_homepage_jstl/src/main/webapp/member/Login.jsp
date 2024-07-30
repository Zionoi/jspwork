<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
	if(id != null){
%>
		<script>
			location.href = "LoginOK.jsp";
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
	<form	action="LoginProc.jsp" method="post">
		<table>	
			<tr>
				<td>ID</td>
				<td><input name="id"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<td colspan="2" text-align="center">
				<input type="submit" value="login">
				<input type="reset">
				<input type="button" value="회원가입" onclick="location.href='member2.jsp'">
				<input type="button" value="홈으로" onclick="location.href='../Index.jsp'">
				</td>
			</tr>
		</table>
	</form>

</body>
</html>