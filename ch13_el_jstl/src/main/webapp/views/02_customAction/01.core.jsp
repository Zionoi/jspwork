<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성==attribute)</h3>
	<pre>
	* 변수 선언과 동시에 초기화 (c:set var="" value="" [scope=""])
		- 변수를 선언하고 초기값을 대입해두는 기능을 제공
		- 해당 변수를 어떤 scope에 담아둘건지 지정가능(생략시 기본값 pageScope에 담김)
			=> 해당 scope에 setAttribute를 통해 key-value형태로 데이터를 담아 놓는것이라고 생각하면 됨
			=> c:set으로 선언된 변수는 EL로 접근하여 사용가능
			
		- 변수 타입을 별도로 지정하지 않음
		- **초기값은 반드시 지정해둬야 함!!!!
	</pre>
	
	<c:set var="num1" value="10" />  				<!-- pageContext.setArrtibute("num1", "10") 와 동일 -->
	<c:set var="num2" value="20" scope="request"/>  <!-- request.setArrtibute("num2", "20") 와 동일 -->
	
	num1 변수값 : ${num1 }<br>
	num2 변수값 : ${num2 }<br>
	
	<%-- <c:set var="result" value="num1+num2"/> --%> <!-- String문자열이 됨 -->
	<c:set var="result" value="${num1+num2 }" scope="session"/> <!-- 이렇게 해야 의도한대로 됨. -->
	result 변수값 : ${result }<br>
	
	pageScope.num1 : ${pageScope.num1 }<br>
	requestScope.num2 : ${requestScope.num2 }<br>
	sessionScope.result : ${sessionScope.result }<br>
	requestScope.result : ${requestScope.result }<br> <!-- request에는 아무것도 안넣어놨음 빈값출력 -->
	
	
	<!-- value속성 대신에 시작태그와 종료태그 사이에 초기값 지정 가능 -->
	<c:set var="result" scope="request" >
		여기다 넣은값이 value값이 됨 ㅇㅋ?<br>
	</c:set>
	<br><br>
	requestScope.result : ${requestScope.result }<br>
	
	
	<h3>2. 변수 삭제</h3>
	<pre>
	* 변수 삭제 : (c:remove var="제거하고자하는 변수명" [scope=""])
		- 해당 scope영역에서 해당 변수를 찾아서 제거하는 태그
		- scope 지정 생략시 모든 scope에서 해당 변수를 다 찾아서 제거함
		 => 해당 scope에 .removeAttribute를 통해 삭제와 동일
	</pre>
	
	삭제전 result :${result } <!-- session하고 request중 영역이 더 좁은 request의 리절트가 출력됨 -->
<%-- 	
	1) 특정 scope지정하여 삭제 <br>
	<c:remove var="result" scope="request"/>
	삭제후 result :${result } <!-- 위 행에서 request 리절트를 삭제했으므로 session에 배정한 30이 출력됨 --> --%>
	
	2) 모든 scope에서 삭제<br>
	<c:remove var="result"/>
	모두 삭제후 result : ${result }<br><br>
	
</body>
</html>