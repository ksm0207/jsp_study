<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="wrap">
		<header>
			<h1>파라미터 연습입니다. -jsp</h1>
		</header>
		
		<article>
			<form action="ex2.jsp" method="POST">
				
				<label for="name">이름 :</label>
				<input type="text" id="name" name="name"><br>
				
				<label for="h1">취미 :</label>
				<input type="checkbox" id="h1" name="hobby" value="독서">
				<span>독서</span>&nbsp; &nbsp;
				
				<input type="checkbox" id="h2" name="hobby" value="음악">
				<span>음악감상</span>&nbsp; &nbsp;
				
				<input type="checkbox" id="h3" name="hobby" value="영화">
				<span>영화감상</span>&nbsp; &nbsp;
				
				<input type="checkbox" id="h4" name="hobby" value="게임">
				<span>게임</span>&nbsp; &nbsp;
				
				<input type="checkbox" id="h5" name="hobby" value="등산">
				<span>등산</span>&nbsp; &nbsp;
				
				<input type="checkbox" id="h6" name="hobby" value="낚시">
				<span>낚시</span>&nbsp; &nbsp;
				<br>
				<button id="data_btn" type="button"
				        onclick="send(this.form)">파라미터 보내기</button>
			
			</form>			
		</article>
	</div>
	
	<script type="text/javascript">
		function send(form){
			
			let name = form.name.value;
			console.log(`${name}`);
			console.log(`${name}`);
			
			if(name.trim().length <= 0){
				alert("이름을 입력하세요.")
				form.name.focus();
				form.name.value ="";
				return false;
			}
			form.submit();
			
			
			
		}
	</script>

</body>
</html>