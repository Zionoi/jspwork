<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% /*스크립트릿  */
		float f = 4.67f;
		int num = Math.round(f);
		java.util.Date date = new java.util.Date();
		int hour = date.getHours();
	%>
	<%! /* 선언문 */
		public int max(int i, int j){
		return i > j ? i : j;
		}
	%>
	실수를 반올림 한 값 = <%=num %><br>
	오늘 날짜와 시간 = <%=date %><br>
	현재 오전, 오후 중 언제인가요? <%=(hour < 12) ? "오전":"오후" %><br>
	두 수중 큰수는 = <%=max(5,2) %><br>
</body>
</html>