<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%!String msg; %>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String color = request.getParameter("color");
	
	
	/* switch(color){
	case "blue" : 
		msg = "파란색";
		break;
	case "red" :
		msg = "빨간색";
		break;
	case "green" :
		msg = "초록색";
		break;
	case "etc" :
		msg = "기타"; 
	}	
		*/
		
		if(color.equals("blue")){
			msg = "파란색";
		}else if(color.equals("red")){
			msg = "빨간색";
		}else if(color.equals("green")){
			msg = "초록색";
		}else if(color.equals("etc")){
			msg = "기타";
		}
		
%>
</head>
<body bgcolor="<%=color%>">
	<b><%=name %>님이 좋아하는 색상은<b><%=msg %></b><br>
	<%=color %>
	
</body>
</html>