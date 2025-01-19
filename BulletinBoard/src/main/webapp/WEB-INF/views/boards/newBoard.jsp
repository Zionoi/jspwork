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
        <h1>게시글 작성</h1>
    </header>
    <main>
        <form action="/boards" method="POST" name="board">
            <fieldset>
                <legend>게시글 작성 폼</legend>
                <div>
                    <label for="boardTitle">제목</label>
                    <input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력하세요." required>
                </div>
                <div>
                    <label for="boardWriter">작성자</label>
                    <input type="text" id="boardWriter" name="boardWriter" placeholder="작성자를 입력하세요." required>
                </div>
                <div>
                    <label for="boardContent">내용</label>
                    <textarea id="boardContent" name="boardContent" placeholder="내용을 입력하세요." required></textarea>
                </div>
                <button type="submit">작성</button>
            </fieldset>
        </form>
    </main>

</body>
</html>