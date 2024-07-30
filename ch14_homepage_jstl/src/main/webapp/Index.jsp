<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><!-- jstl 사용시 필요한 문구 -->

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
				<c:choose>
					<c:when test="${empty idKey }">
						<li><a href="member/Login.jsp">로그인</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="member/Logout.jsp">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</nav>
		<div id="login">
		<c:if test="${not empty idKey }">
			<p>[${idKey }님 로그인 상태]</p>
		</c:if>
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