<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글 보기</title>
<style>
	/* img{ width:500px;} */
</style>
</head>
<body>
	<img src="../resources/img1.png">
	<table>
		<thead>
			<tr>

				<th>이름 : </th>
				<td><input name="name" id="name"></td>
			</tr>
			<tr>
				<th>댓글작성</th>
				<td>
					<textarea rows="3" cols="50" id="replyContent"></textarea>
				</td>
				<td><button id="btn1">댓글등록</button></td>
			</tr>
		</thead>
		<tbody id="tbody">
		
		</tbody>	
	</table>
	
	<script>
		$(()=>{
			selectReplyList();
			
			// 1초마다 댓글리스트 새로 가져옴 이때는 () 안써줘도 된다.
			// setInterval(selectReplyList, 1000);
		})
		function selectReplyList(){
			$.ajax({
				url: "rlist.bo",
				data : {bnum: 1}, // 원글의 num값을 넘겨준다
				success : function(result){
					console.log(result);
					let value = "";
					for(let i=0;i<result.length;i++){
						value += "<tr>"
							   + "<td>" + result[i].name + "</td>"
							   + "<td>" + result[i].content + "</td>"
							   + "<td>" + result[i].redate + "</td>"
							   + "</tr>";
							   
					}
					$("#tbody").html(value);
				},
				error : function(){
					console.log("ajax 통신 실패")
				}
			})
		}
		
		
		$(() => {
			$("#btn1").click(function() {
				$.ajax({
					url : "rinsert.bo",
					data : {
						bnum: 1,
						content : $("#replyContent").val(),
						name :  $("#name").val()
					},
					type : "post",
					success : function(result){
						console.log(result);
						if(result){
							alert("댓글작성완료");
							
							//창을 새로고침하면 ajax쓸 필요가 없어짐
							//location.reload();
							
							//리스트만 새로 호출하면 다른 부분은 새로고침할 필요 없어짐
							selectReplyList();
						}else{
							alert("댓글작성실패");
						}
						
					},
					error : function(){
						console.log('ajax 통신 실패');
					}
				})
			})
		})
	</script>
	
</body>
</html>