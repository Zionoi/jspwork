<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="regBean" class="ch05.MemberBean" />
<jsp:setProperty name="regBean" property="*"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	아이디 : <jsp:getProperty property="id" name="regBean"/><br>
	비밀번호 : <jsp:getProperty property="pwd" name="regBean"/><br>
	이름 : <jsp:getProperty property="name" name="regBean"/><br>
	생일 : <jsp:getProperty property="birthday" name="regBean"/><br>
	이메일 : <jsp:getProperty property="email" name="regBean"/><br>

	

</body>
</html>