<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<link href="resources/css/Index.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.3/jquery-ui.min.js"></script>
    <script src="resources/js/jQueryUser.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<div class="logo">
			<img src="https://www.tjoeun.co.kr/images/logo.gif?v=20190918" alt="로고">
		</div>
		<nav>
			<ul class="nav">
				<li><a href="vote/votelist.jsp">투표프로그램</a></li>
				<li><a href="board/list.jsp">게시판</a></li>
				<%if(id==null){ %>
					<li><a href="member/Login.jsp">로그인</a></li>
				<%}else { %>
					<li><a href="member/Logout.jsp">로그아웃</a></li>
				<%} %>
			</ul>
		</nav>
		<div id="login">
		<% if(id != null){ %>
			<p>[<%=id %>님 로그인 상태]</p>
		<%} %>
		</div>
	</header>
	<article>
		<section id="imgslide">
			<div>
				<img src="resources/img/우주선.jpg" alt="미래도시1">
				<img src="resources/img/우주선.jpg" alt="미래도시2">
				<img src="resources/img/우주선.jpg" alt="미래도시3">
			</div>
		</section>
	</article>
</body>
</html>