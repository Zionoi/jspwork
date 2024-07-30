<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.tjoeun.vo.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수(속성==attribute)</h3>
	<pre>
	* 변수 선언과 동시에 초기화 (c:set var="" value="" [scope=""])
		- 변수를 선언하고 초기값을 대입해두는 기능을 제공
		- 해당 변수를 어떤 scope에 담아둘건지 지정가능(생략시 기본값 pageScope에 담김)
			=> 해당 scope에 setAttribute를 통해 key-value형태로 데이터를 담아 놓는것이라고 생각하면 됨
			=> c:set으로 선언된 변수는 EL로 접근하여 사용가능
			
		- 변수 타입을 별도로 지정하지 않음
		- **초기값은 반드시 지정해둬야 함!!!!
	</pre>
	
	<c:set var="num1" value="10" />  				<!-- pageContext.setArrtibute("num1", "10") 와 동일 -->
	<c:set var="num2" value="20" scope="request"/>  <!-- request.setArrtibute("num2", "20") 와 동일 -->
	
	num1 변수값 : ${num1 }<br>
	num2 변수값 : ${num2 }<br>
	
	<%-- <c:set var="result" value="num1+num2"/> --%> <!-- String문자열이 됨 -->
	<c:set var="result" value="${num1+num2 }" scope="session"/> <!-- 이렇게 해야 의도한대로 됨. -->
	result 변수값 : ${result }<br>
	
	pageScope.num1 : ${pageScope.num1 }<br>
	requestScope.num2 : ${requestScope.num2 }<br>
	sessionScope.result : ${sessionScope.result }<br>
	requestScope.result : ${requestScope.result }<br> <!-- request에는 아무것도 안넣어놨음 빈값출력 -->
	
	
	<!-- value속성 대신에 시작태그와 종료태그 사이에 초기값 지정 가능 -->
	<c:set var="result" scope="request" >
		여기다 넣은값이 value값이 됨 ㅇㅋ?<br>
	</c:set>
	<br><br>
	requestScope.result : ${requestScope.result }<br>
	
	
	<h3>2. 변수 삭제</h3>
	<pre>
	* 변수 삭제 : (c:remove var="제거하고자하는 변수명" [scope=""])
		- 해당 scope영역에서 해당 변수를 찾아서 제거하는 태그
		- scope 지정 생략시 모든 scope에서 해당 변수를 다 찾아서 제거함
		 => 해당 scope에 .removeAttribute를 통해 삭제와 동일
	</pre>
	
	삭제전 result :${result } <!-- session하고 request중 영역이 더 좁은 request의 리절트가 출력됨 -->
<%-- 	
	1) 특정 scope지정하여 삭제 <br>
	<c:remove var="result" scope="request"/>
	삭제후 result :${result } <!-- 위 행에서 request 리절트를 삭제했으므로 session에 배정한 30이 출력됨 --> --%>
	
	2) 모든 scope에서 삭제<br>
	<%-- <c:remove var="result"/> --%>
	모두 삭제후 result : ${result }<br><br>
	
	<hr>
	
	<pre>
	* 데이터를 출력하고자 할 때 사용하는 태그
	 - (c:out value="출력하고자하는 값" [default="기본값"] [excapeXml="true|false"])
	
	</pre>
	
	<c:out value="${result }" /><br>
	<c:out value="${abcd }" default="키 선언 한게 없을땐 디폴트값 출력됨"/><br>
	
	<c:set var="outTest" value="<b>출력테스트</b>"/>	
	
	<c:out value="${outTest }"/>
	<c:out value="${outTest }" escapeXml = "false"/> <!--escapeXml : 기본값 true 트루일땐 태그를 수행하지 않음(태그도 문자열 취급)  -->
	
	<hr>
	
	<h3>2. 조건문 - if</h3>
	<pre>
	* (c:if test="조건식")
	- java의 if문과 비슷한 역할을 하는 구문
	- 조건식은 test속성에 작성(단, EL구문으로 기술해야 됨)
	</pre>
	<br>
	-jsp 방법 <br>
	<%
		if(10 > 3) {
	%>
			<b>10</b>
	<%		
		}
	%>
	<br>
	-jstl 방법 <br>
	
	<c:if test="${num1 < num2 }">
		<b>num1이 num2보다 크다</b> <!-- 조건문이 참일시 실행될 구문 -->
	</c:if>
	<br>
	<c:if test="${num1 >= num2 }">
		<b>num1이 num2보다 크거나 같다</b>
	</c:if>
	
	<c:set var="str" value="안녕하세요"/>
	
	<c:if test="${str == '안녕하세요' }">
		같다
	</c:if>
	
	<c:if test="${str ne '안녕하세요' }">
		<b>다르다</b>
	</c:if>
	
	<hr>
	
	<h3>3. choose</h3>
	<pre>
	* (c:choose, c:when, c:otherwise)
		- java의 if-else와 비슷한 역할을 하는 태그
		- 각조건들을 c:choose(=if)의 하위요소로 c:when(=else if)을 통해서 작성(else문의 역할은 c:otherwise가 한다)
	</pre>
<%--
	-jsp방법
	 
	<% if(10>3){%>
		
	<%}else if(10>5){%>
	
		
	<%}else{%>
	<%}	%>
--%>	
	
	<c:choose>
		<c:when test="${num1 gt 20 }">
			<b>20보다 큰값</b>
		</c:when>
		<c:when test="${num1 ge 10 }">
			<b>10보다 크고 20보다 작은값</b>
		</c:when>
		<c:otherwise>
			<b>10보다 작은값</b>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<h3>4. 반복문</h3>
	<pre>
	* for loop문 - (c:forEach var="변수명" begin="초기값" end="끝값" [step="증가값(기본값 1)"])
	* 향상된 for문 - (c:forEach var="변수명" items="순차적으로 접근하고자 하는 객체(배열|컬렉션)"[varStatus="현재접근된 요소의 상태값을 보관할 변수명"])
	</pre>
<%-- 	
	<c:forEach var="i" begin="10" end="1" step="-2">  스텝은 음수로 설정할수 없다
		반복확인 : ${i}<br>
	</c:forEach>
	 --%>
	
	<c:forEach var="i" begin="1" end="6">
		<h${i}>태그안에서도 적용가능</h${i}>
	</c:forEach>
	
	<c:set var="colors">
		red,yellow,green,pink
	</c:set>
	
	color 변수값 : ${colors }<br>
	
	<ul>
		<c:forEach var="c" items="${colors }"> <!-- 따로 설정하지않아도 , 를 기준으로 하나하나 가져온다  -->
			<li style="color:${c}">${c}</li>
		</c:forEach>
	</ul>
	
	
	<%
		ArrayList<Person> list = new ArrayList<Person>();
		list.add(new Person("이고잉",25,"여자"));
		list.add(new Person("아무개",400,"남자"));
		list.add(new Person("홍길동",50,"남자"));
		
	%>
	
	
	<c:set var="plist" value="<%=list %>" scope="request"/>
<%-- 	
<!-- 1. 기본 forEach 사용  -->
	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty plist }">
					<tr>
						<td colspan="3"><b>리스트가 비어있습니다</b></td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<!-- 1. 기본 forEach 사용  -->
					<c:forEach var="l" items="${ plist}">
						<tr>
							<td>${l.name }</td>
							<td>${l.age }</td>
							<td>${l.gender }</td>
						</tr>
					</c:forEach>
					
					 
					 
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	 --%>
	
<!-- 2. 속성추가 forEach 사용 -->
	<table border="1">
		<thead>
			<tr>
				<th>index번호</th>
				<th>count번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty plist }">
					<tr>
						<td colspan="3"><b>리스트가 비어있습니다</b></td>
					</tr>
				</c:when>
				
				<c:otherwise>
				<!-- 2. 속성추가 forEach 사용 -->
					<c:forEach var="l" items="${ plist}" varStatus="status"> <!-- varStatus=변수명 자유롭게 -->
						<tr>
							<td>${status.index }</td> <!-- index속성 : 0부터 시작 -->
							<td>${status.count * 2}</td> <!-- count속성 : 1부터 시작 -->							<td>${l.name }</td>
							<td>${l.age }</td>
							<td>${l.gender }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>
	
	<hr>
	
	<h3>5. 반복문 : forTokens</h3>
	<pre>
	* (c:forTokens var="변수명" items="분리시키고자하는 문자열" delims="구분자")
	  - 구분자를 통해서 분리된 각각의 문자열을 순차적으로 적근하면서 반복 수행
	  - java의 split("구분자") 또는 StringTokenizer와 비슷한 기능
	</pre>
					
	<c:set var="device" value="컴퓨터,핸드폰,TVㄱ에어컨/냉장고.세탁기"/>
	
	<ol>
		<c:forTokens var="d" items="${device }" delims=",./ㄱ드">
			<li>${d }</li>
		</c:forTokens>
	</ol>
	
	<hr>
	
	<h3>6. url, 쿼리스트링 관련</h3>
	<pre>
	*url 경로를 생성하고, 쿼리스트링을 정의 둘 수 있는 태그
	
	&lt;c:url var="변수명" value="요청할 url"&gt;
		&lt;c:param name="키1" value="전달할 값" /&gt;
		&lt;c:param name="키2" value="전달할 값" /&gt;
		...
	&lt;/c:url&gt; 
	</pre>
	
	<a href="list.bo?nowpage=2&num=3">기존방식</a> <br><br>
	
	<c:url var="u" value="list.bo">
		<c:param name="nowpage" value="2"/>
		<c:param name="num" value="3"/>
	</c:url>
	<a href="${u }">c:url을 이용한 방식</a>
	
	
	
</body>
</html>