<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	// 쿠키의 값에 띄어쓰기, 특수기호 안됨.
	Cookie cookie = new Cookie("myCookie", "Apple");
	response.addCookie(cookie);
	// 이걸 한줄로 줄일 수 있음
	
	response.addCookie(new Cookie("NAME", "John"));
	response.addCookie(new Cookie("GENDER", "Male"));
	response.addCookie(new Cookie("AGE", "25"));
		
%>  
	쿠키생성<p/>
	쿠키의 내용은 <a href="02.2.tasteCookie.jsp">클릭하세요</a>
  
</body>
</html>