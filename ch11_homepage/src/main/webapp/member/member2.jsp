
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("idKey");
	if(id != null){
%>
   	<script>
   		location.href="LoginOK.jsp";
   		
	
   	</script>

<%
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!--
    * 자바스크립트수정시 서버를 재시작해도 캐시가 남아있어서 적용이 안될수있다
    그럴땐 아래문구를 자바스크립트 scr에 추가해주면 해결된다.
    ?ver=<%=System.currentTimeMillis() %>  -->
<script src="script.js?ver=<%=System.currentTimeMillis() %>" charset="utf-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function findAddr(){

    new daum.Postcode({
        oncomplete: function(data) {
            let roadAddr = data.roadAddress; // 도로명 주소
            let jibunAddr = data.jibunAddress; // 지번 주소
            let extraAddr = '';
            
            document.getElementById("postcode").value = data.zonecode; //우편번호
            if(data.userSelectedType == 'R'){		// 사용자가 도로명을 선택했을 때
            	if(data.bname !=''){
            		extraAddr += data.bname; //동이름
            	}
            	if(data.buildingName != ''){
            		extraAddr += ', ' + data.buildingName;
            	}
            	roadAddr += extraAddr != '' ? '('+ extraAddr + ')' : '';
            	document.getElementById('addr').value = roadAddr;
            }else {
            	if(data.buildingName != ''){
            		extraAddr += ', ' + data.buildingName;
            	}
            	jibunAddr += extraAddr != '' ? '('+ extraAddr + ')' : '';
            	document.getElementById('addr').value = jibunAddr;
            }
            document.getElementById('detailAddr').focus();
        }
    }).open();
	
	}
</script>
</head>
<body>
    <form name="frm" method="post" action="memberProc.jsp">
        <table border="1">
            <tr>
                <th colspan="3">회원가입</th>
            </tr>
            <tr>
                <td>아이디</td>
                <td>
	                <input type="text" name="id" onkeydown="inputIdChk();"> 
	                <input type = "button" value="ID중복확인" onclick="idCheck(this.form.id.value);">
	                <input type="hidden" name="idBtnCheck" value="idUncheck">
                </td>
                <td>영문과 숫자로만 입력.</td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="pwd"></td>
                <td>특수기호, 영문, 숫자가 각 1개 이상씩 들어가야 되고 8글자 이상</td>
            </tr>
            <tr>
                <td>비밀번호 확인</td>
                <td><input type="password" name="repwd"></td>
                <td>위에 비밀번호를 한번더 넣으세요</td>
            </tr>
            <tr>
                <td>이름</td>
                <td><input type="text" name="name"></td>
                <td>한글로 입력</td>
            </tr>
            <tr>
                <td>성별</td>
                <td><input type="radio" name="gender" value="1" checked>남 &emsp;
                    <input type="radio" name="gender" value="2">여</td>
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
                <td><input type="text" name="zipcode" id="postcode" readonly>
                    <input type="button" value="'우편번호 찾기" onclick="findAddr()"></input></td>
                <td>우편번호를 검색하세요</td>
            </tr>
            <tr>
                <td>주소</td>
                <td><input type="text" name="address" id="addr" size="60" readonly><br>
                    <input type="text" name="detail_address" id="detailAddr" placeholder="상세주소 넣기"></td>
                <td>상세주소가 있으면 입력해주세요</td>
            </tr>
            <tr>
                <td>취미</td>
                <td><input type="checkbox" name="hobby" value="독서" id="reading">
                    <label for="reading">독서</label> &emsp;
                    <input type="checkbox" name="hobby" value="운동" id="sport">
                    <label for="sport">운동</label> &emsp;
                    <input type="checkbox" name="hobby" value="자바" id="java">
                    <label for="java">자바</label> &emsp;
                    <input type="checkbox" name="hobby" value="음악" id="music">
                    <label for="music">음악</label> &emsp;
                    <input type="checkbox" name="jsp" value="jsp" id="jsp">
                    <label for="music">jsp</label> &emsp;
                </td>
                <td>취미를 선택해 주세요</td>
            </tr>
            <tr>
                <td>직업</td>
                <td><select name="job">
                    <option value="무직" selected>무직</option>
                    <option value="회사원">회사원</option>
                    <option value="음악가">음악가</option>
                    <option value="교육자">교육자</option>
        
                </select></td>
                <td>직업을 선택하세요</td>
            </tr>
            <tr>
                <th colspan="3" text-align="center">
                    <input type="button" value="회원가입" onclick="inputCheck();">    
                    <input type="reset" value="다시쓰기">
                    <input type="button" value="로그인" onclick="location.href='hh.jsp'">     
                </th>
            </tr>
        </table>
    </form>
</body>
</html>