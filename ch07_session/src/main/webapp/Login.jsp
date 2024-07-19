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
		ID : <input name="id">
		PW : <input type="password" name="pwd"><p/>
		<input type="submit" value="login">
		<input type="reset">
	
	</form>

</body>
</html>