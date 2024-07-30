
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="">
        <table border="1">
            <tr>
                <th colspan="3">회원가입</th>
            </tr>
            <tr>
                <td>아이디</td>
                <td><input type="text" name="id"> <button>ID중복확인</button></td>
                <td>영문과 숫자로만 입력.</td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pwd"></td>
                <td>특수기호, 영문, 숫자가 각 1개 이상씩 들어가야 되고 8글자 이상</td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="rePw"></td>
                <td>위에 비밀번호를 한번더 넣으세요</td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="name"></td>
                <td>한글로 입력</td>
            </tr>
            <tr>
                <td>성별</td>
                <td><input type="radio" name=:"gender" value="1" checked>남 &emsp;
                    <input type="radio" name=:"gender" value="2">여</td>
                <td>성별을 선택해 주세요</td>
            </tr>
            <tr>
                <td>생년월일</td>
                <td><input type="number" name="birthday"></td>
                <td>6글자로 입력 ex) 930827</td>
            </tr>
            <tr>
                <td>E-mail</td>
                <td><input type="text" name="email"></td>
                <td>ex) email@naver.com</td>
            </tr>
            <tr>
                <td>우편번호</td>
                <td><input type="text" name="zipcode" id="postcode">
                    <input type="button" value="'우편번호 찾기"></input></td>
                <td>우편번호를 검색하세요</td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" name="address" id="addr" size="60"><br>
                    <input type="text" name="detail_address" id="detailAddr"></td>
                <td>상세주소가 있으면 입력해주세요</td>
            </tr>
            <tr>
                <td>취미</td>
                <td><input type="checkbox" name="hobby" value="reading" id="reading">
                    <label for="reading">독서</label> &emsp;
                    <input type="checkbox" name="hobby" value="sport" id="sport">
                    <label for="sport">운동</label> &emsp;
                    <input type="checkbox" name="hobby" value="java" id="java">
                    <label for="java">자바</label> &emsp;
                    <input type="checkbox" name="hobby" value="music" id="music">
                    <label for="music">음악</label> &emsp;
                </td>
                <td>취미를 선택해 주세요</td>
            </tr>
            <tr>
                <td>직업</td>
                <td><select name="job">
                    <option value="0" selected>무직</option>
                    <option value="회사원">회사원</option>
                    <option value="음악가">음악가</option>
                    <option value="교육자">교육자</option>
        
                </select></td>
                <td>직업을 선택하세요</td>
            </tr>
            <tr>
                <th colspan="3" text-align="center">
                    <input type="button" value="회원가입"></input>    
                    <input type="reset" value="다시쓰기"></input>    
                    <input type="button" value="로그인"></input>     
                </th>
            </tr>
        </table>
    </form>
</body>
</html>