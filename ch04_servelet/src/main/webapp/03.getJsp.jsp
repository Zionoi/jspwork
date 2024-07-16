<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Get Servlet방식</h1>
	<form action="GetServlet" ><!--form 속성에 method 안적으면 method="get" 기본값으로 설정됨 -->
		msg : <input name="msg"><p/>
		<input type="submit">
	</form>

</body>
</html>