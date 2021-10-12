<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<body>
	<h1>회원가입 페이지 - sign_up.jsp</h1>

<div>
	<form action="MemberController" method = "GET">
			
		<label>ID : </label>
		<input type="text" id = "id" name = "id">
		<div id="check"></div>
		<br>
		
		<label>PW: </label>
		<input type="password" id="pw" name = "pw"><br>
	
		<label>Name : </label>
		<input type="text" id="name" name = "name"><br>
		
		<label>Phone : </label>
		<input type="text" id="phone" name = "phone" placeholder="- 빼고 입력해주세요."><br>
		<input type="hidden" name = "search" value ="signUp">
		<button type="button" onclick="create()">가입</button>
	</form>
	
</div>

<script>

	function create(){
		
		let id_check = $("#chk").hasClass("success");
		
		if(!id_check){
			alert('아이디 체크를 진행해주세요.');
			return false;
		}
		
		let id = $("#id").val();
		let pw = $("#pw").val();
		let name = $("#name").val();
		let phone = $("#phone").val();
		
		if(id.trim().length < 1){
			alert("아이디를 입력하세요");
			return false;
		}
		
		if(pw.trim().length < 1){
			alert("비밀번호를 입력하세요.");
			return false;
		}
		
		document.forms[0].submit();
		
		
	}
	
	$(function(){
		console.log("read");
		
		$("#id").on("keyup",function(){
			
			let id = $(this).val();
			console.log(id);
			
			if(id.trim().length > 4){
				
				$.ajax({
					url : "MemberController",
					data : "search="+"check&id="+id.trim(),
					type : "POST",
				})
				.done(function(data){
					$("#check").html(data);
				})
				.fail(function(data){
					alert(data)
				})
			}
			
			
			
		}); // end of Id Check
	});
	
	
	
</script>



</body>
</html>