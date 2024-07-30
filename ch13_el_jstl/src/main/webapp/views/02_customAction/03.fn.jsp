<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> <!-- jstl function 사용시 필요한 문구 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Function Library</h1>
	
	<c:set var="str" value="How are you?" />
	
	str : ${ str }<br><br>
	
	문자열의 길이 : ${str.length() }<br> <!-- 메소드로 구현되어있어서 () 넣어줘야함 -->
	문자열의 길이 : ${fn : length(str) }<br>	<!-- ArrayList객체의 길이도 이 메소드로 구할수있음(size()안해도 됨) -->
	
	모두 대문자로 출력 : ${fn:toUpperCase(str) }<br>
	모두 소문자로 출력 : ${fn:toLowerCase(str) }<br>
	
	are의 시작 인덱스 번호 :  ${fn:indexOf(str,'are') }<br>
	
	are를 were로 변경 : ${fn:replace(str, 'are', 'were') }<br>
	
	str : ${ str }<br><br>
	fn:메소드로 변경해도 원본은 안바뀜 출력시에만 해당 메소드로 바꾼값 출력
	<br><br>
	<c:if test="${fn:contains(str,'are') }">
		str에 are이 포함되어있음
	</c:if>
	
	
</body>
</html>