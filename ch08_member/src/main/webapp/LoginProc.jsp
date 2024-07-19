<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="Mgr" class ="ch08.MemberMgr"  />
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");

	if(Mgr.loginRegister(id,pwd)){
		session.setAttribute("idKey",id);
	
%>
	<script>
		alert("로그인 되었습니다.")
		location.href="LoginOK.jsp";
	</script>
<%
	}else{
%>		
		<script>
			alert("로그인 되지 않았습니다.")
			location.href="hh.jsp";
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

</body>
</html>