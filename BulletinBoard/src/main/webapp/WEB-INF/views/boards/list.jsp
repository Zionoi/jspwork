<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 목록</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h1>게시판 목록</h1>
		<a href="/boards/new" class="btn btn-primary mb-3">새 글 작성</a>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>board_no</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>액션</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${boards}">
				    <tr>
				        <td>${board.boardNo}</td>
				        <td><a href="/boards/${board.boardNo}">${board.boardTitle}</a></td>
				        <td>${board.boardWriter}</td>
				        <td>${board.createDate}</td>
				        <td>
				            <a href="/boards/${board.boardNo}/edit" class="btn btn-sm btn-warning">수정</a>
				            <form action="/boards/${board.boardNo}/delete" method="post" style="display:inline;">
				                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</button>
				            </form>
				        </td>
				    </tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>