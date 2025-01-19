<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 상세보기</title>
</head>
<body>
    <header>
        <h1>게시글 상세보기</h1>
    </header>
    <main>
        <section>
            <table border="1">
                <tr>
                    <th>번호</th>
                    <td>${board.boardNo}</td>
                </tr>
                <tr>
                    <th>제목</th>
                    <td>${board.boardTitle}</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${board.boardWriter}</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${board.createDate}</td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td>${board.boardContent}</td>
                </tr>
            </table>
        </section>
        <section>
            <button onclick="location.href='/boards/list'">목록으로</button>
            <button onclick="location.href='/boards/${board.boardNo}/edit'">수정</button>
            <form action="/boards/${board.boardNo}/delete" method="POST" style="display: inline;">
                <button type="submit" onclick="return confirm('정말 삭제하시겠습니까?')">삭제</button>
            </form>
        </section>
    </main>
</body>
</html>
