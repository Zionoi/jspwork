<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="chun.*" %>
<jsp:useBean id="cDao" class="chun.chunDao" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body {
        margin: 0;
        font-family: Arial, sans-serif;
    }

    .container {
        display: flex;
        flex-direction: column;
        align-items: center;
        padding-top: 20px;
    }

    .mainHead {
        width: 1200px;
        height: 200px;
        text-align: center;
        border: 1px solid #000;
        line-height: 200px;
        background-color: #4CAF50;
        color: #fff;
        margin-bottom: 20px;
    }

    .formContainer {
        width: 1200px;
        text-align: left;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    table, th, td {
        border: 1px solid #000;
    }

    th, td {
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    a {
        text-decoration: none;
        color: #007BFF;
    }
</style>
</head>
<body>
    <div class="container">
        <div class="mainHead">
            <h1>춘대학교</h1>
        </div>

        <div class="formContainer">
            <%
                String id = (String)session.getAttribute("idKey");
            	ChunBean cDaoBean = (ChunBean)session.getAttribute("cDaoBean");
                if (id == null) {
            %>
                <form action="LoginServlet" method="post">
                    <table width="400px">
                        <tr>
                            <th>ID : </th>
                            <td><input name="id"></td>
                            <td rowspan="4"><input type="submit" value="로그인" style="height: 48px"></td>                           
                        </tr>
                        <tr>
                            <th>PW : </th>
                            <td><input type="password" name="pw"></td>
                        </tr>
                    </table>
                </form>
            <%
                } else {
            %>
                <table>
                    <tr>
                        <td colspan="4">
                            <h2>학생정보</h2>
                            <table>
                                <thead>
                                    <tr>
                                        <th>항목</th>
                                        <th>정보</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>학번</th>
                                        <td><%=cDaoBean.getStudent_no()%></td>
                                    </tr>
                                    <tr>
                                        <th>학과</th>
                                        <td>컴퓨터공학과</td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td><%=cDaoBean.getStudent_name() %></td>
                                    </tr>
                                    <tr>
                                        <th>학년</th>
                                        <td>3학년</td>
                                    </tr>
                                    <tr>
                                        <th>지도교수</th>
                                        <td>
                                            교수님 이름
                                            <br>
                                            <a href="professorPage.jsp">교수님 페이지</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>성적</th>
                                        <td>
                                            <ul>
                                                <li>학기별: 1학기 - A, 2학기 - B</li>
                                                <li>학년별: 1학년 - B+, 2학년 - A</li>
                                                <li>총점: 90</li>
                                            </ul>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </table>
                <table>
                    <tr>
                        <td><a href="chunLogout.jsp">로그아웃</a></td>
                    </tr>
                </table>
            <%
                }
            %>
        </div>
    </div>
</body>
</html>
