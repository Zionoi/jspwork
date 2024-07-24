<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, board.*" %>
<jsp:useBean id="bDao" class="board.BoardDao" />
<%
	request.setCharacterEncoding("utf-8");
	int totalRecord = 0;  // 전체 레코드 수(board테이블의 전체 행의 수)
	int numPerPage = 10;  // 1page에 보여줄 레코드 수
	int pagePerBlock = 5; // 블록당 페이지 수 = [1][2][3][4][5]
			
	int totalPage = 0;	  // 전체 페이지 : 레코드수 67개라면, totalPage = 7 
	int totalBlock = 0;   // 전체 블록 수 : 레코드수 67개라면, totalBlock = 2
	
	int nowPage = 1;	  // 현재 해당하는 페이지
	int nowBlock = 1;	  // 현재 해당하는 블록
	
	int start = 1;		  // board테이블의 select시 시작번호(한페이지에 필요한 만큼만 게시물 가져오려고)
	int end = 0;		  // 1page에 보여줄 레코드의 갯수(보통은 10개, 맨 마지막page는 전체레코드수에 따라 달라짐)
	int listSize = 0;	  // 현재 읽어온 게시물의 수
	
	//선언시 스트링 자료형에 ""가 아닌 null로 초기화하면 뒤에서 메소드작업시 null이 아닌 "null"반환되는 경우가 있음
	String keyField = null, keyWord = null;
	if(request.getParameter("keyWord") != null){
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord"); 
	}
	
	/* [처음으로]를 누르면 keyField와 keyWord에 들어있는값 지우기 */
	if(request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")){
			keyField = "";
			keyWord = "";
		}
	}
		
	if(request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}
	
	start = (nowPage * numPerPage) - numPerPage +1; // 각 페이지당 시작번호
	end = nowPage * numPerPage;						// 각 페이지당 끝나는 번호
	totalRecord = bDao.getTotalCount(keyField, keyWord);
	totalPage = (int)Math.ceil(totalRecord / (double)numPerPage); // 전체 페이지 수
	nowBlock = (int)Math.ceil(nowPage / (double)pagePerBlock);	  // 현재 속한 블럭
	totalBlock = (int)(totalPage / (double)pagePerBlock);		  // 전체 블럭
	
	
%>
<!DOCTYPE html>
<html>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" ></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
	* {margin: 0 auto;}
	div {width:800px;}
	h2{text-align:center; }
	.m50 {margin-top:50px;}
	table {margin-top: 30px; width:800px;}
	table th {text-align:center;}
	.a {text-decoration:none; color:black; cursor:pointer;}
	a:link {text-decoration:none; color:black;}
</style>
<script>
	function block(value) {
		document.readFrm.nowPage.value=<%=pagePerBlock%>*(value-1)+1;
		document.readFrm.action="list.jsp";
		document.readFrm.submit();
	}
	
	//클릭한페이지
	function pageing(page){
		document.readFrm.nowPage.value=page;
		document.readFrm.action="list.jsp";
		document.readFrm.submit();
	}
	function list(){
		/*document.listFrm.action="list.jsp";*/
		document.listFrm.submit();
	}
	function read(num){
		document.readFrm.num.value=num;
		document.readFrm.action="read.jsp";
		document.readFrm.submit();
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<h2>JSPBoard</h2>
		<table>
			<tr>
				<td colspan="5">Total : <%=totalRecord %>Articles <font color="red">(<%=nowPage %>/<%=totalPage %>)</font></td>
			</tr>	
			<tr>
				<th width="10%">번호</th>
				<th width="40%">제목</th>
				<th width="15%">이름</th>
				<th width="25%">날짜</th>
				<th width="10%">조회수</th>
			</tr>
		<%
			
			ArrayList<Board> alist = bDao.getBoardList(keyField, keyWord, start, end);
			listSize = alist.size();
			
			for(int i=0;i<listSize;i++){
				Board board = alist.get(i);
				String rdate = board.getRegdate().substring(0,10);
				int depth = board.getDepth();
		%>
			<tr>
				<%-- <td><%=board.getNum() %></td> --%>
				<td>
					<%=totalRecord-(nowPage-1)*numPerPage - i%>
				</td>
				<%-- <td><a href="read.jsp?num=<%=board.getSubject() %>"</a></td> --%>
				<td style="text-align:left;">
				<%
					if(depth > 0){
						for(int j=0;j<depth;j++){
							out.print("&emsp;");
						}
						out.print("📢");
					}
				%>
					<a href="javascript:read('<%=board.getNum() %>')" class="a"><%=board.getSubject() %></a></td>
				<td><%=board.getName() %></td>
				<td><%=rdate %></td>
				<td><%=board.getCount() %></td>
			</tr>	
		<%
			
			}
		
		%>
			<tr>
				<td colspan="3">
				<%
				
					int pageStart = (nowBlock-1) * pagePerBlock + 1;	// 어디블록에 속하는지에 따른 첫번째 페이지	1블록=1, 2블록=6, 3블록=11
					
					// 1블럭=5, 2블럭=10, 3블럭 =15
					int pageEnd	= pageStart + pagePerBlock <= totalPage ? (pageStart + pagePerBlock) : totalPage + 1;			// 어디블록 속하는지에 따른 마지막 페이지
					
					if(totalPage != 0){
						if(nowBlock > 1 ) {
						%>
							<a href="javascript:block('<%=nowBlock-1 %>')">prev...</a>&emsp;
						<%
						}
						for(;pageStart<pageEnd;pageStart++){
						%>
							<a href="javascript:pageing('<%=pageStart %>')" class="a">[<%=pageStart %>]</a>&emsp;
						<%	
						}
						if(totalBlock > nowBlock){
						%>
							<a href="javascript:block('<%=nowBlock+1 %>')">next...</a>&emsp;
						<%	
						}
					}
				%>
				</td>
				<td colspan="2" align="right;">
					<a href="post.jsp" class="a">[글쓰기]</a>&emsp;
					<a href="javascript:list();" class="a">[처음으로]</a>
				</td>
			</tr>
		</table>
		<!-- list.jsp?keyField=이름&keyWord=동 -->
		<form name="searchFrm" method="get" action="list.jsp">
			<table align="center" width="700">
				<tr>
					<td align="center">
						<select name="keyField">
							<option value="name">이름</option>
							<option value="subject">제목</option>
							<option value="content">내용</option>
						</select>
						<input name="keyWord" required>
						<input type="submit" value="찾기">
					</td>
				</tr>
			</table>
		</form>
	
<!-- 	처음으로 누르면 화면 reload -->
	<form name=listFrm>
		<input type="hidden" name="reload" value="true">
		<input type="hidden" name="nowPage" value="1">
		
	</form>
	
	<!-- 사용자가 만약[2]를 누르면 2번째 페이지 보여주기 -->
	<form name="readFrm">
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type="hidden" name="keyField" value="<%=keyField %>">
		<input type="hidden" name="keyWord" value="<%=keyWord %>">
		
	</form>
	

	</div>
</body>
</html>