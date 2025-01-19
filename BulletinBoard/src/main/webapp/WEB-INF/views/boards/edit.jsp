<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
        <h1>게시글 수정</h1>
    </header>
    <main>
        <form action="/boards/${board.boardNo}" method="POST" name="board">
            <fieldset>
                <legend>게시글 수정</legend>
                <div>
                    <label for="boardTitle">제목</label>
                    <input type="text" id="boardTitle" name="boardTitle" value="${board.boardTitle }" required>
                </div>
                <div>
                    <label for="boardWriter">작성자</label>
                    <input type="text" id="boardWriter" name="boardWriter" value="${board.boardWriter }" required>
                </div>
                <div>
                    <label for="boardContent">내용</label>
                    <textarea id="boardContent" name="boardContent" required>${board.boardContent }</textarea>
                </div>
                <button type="submit">작성</button>
            </fieldset>
        </form>
    </main>

</body>
</html>