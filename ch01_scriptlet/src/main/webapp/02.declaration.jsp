<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
		선언문 : 메소드 생성 및 멤버변수 생성시
		<$! 
			프로그램
		 $>
	--%>
	
	나의 이름은 <%=name %>입니다 <br>
	나이는 <%=age %>입니다.
	<%--  //나의 이름은 <%=name2 %>입니다 => 이렇게하면 오류뜸 name2는 !표없이 지역변수기때문  --%>
	<%!
		String name = "김요한";
		int age = 32;
	%>
	<% String name2 = "홍길동"; %>
	
	<!-- 메소드 선언은 반드시 선언문에서만 가능 -->
	
	<%!
		int one;
		int two = 1;
		
		public int plusMethod(int one){
			return one + two;
		}
	
	%>
	one과 two의 합은 ? <%=plusMethod(5) %><br>
	
</body>
</html>