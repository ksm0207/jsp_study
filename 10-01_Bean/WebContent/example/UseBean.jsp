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
			<h1>Form연습. - UseBean 활용하기. </h1>
		</header>
		<article>
			<form action="transmission.jsp" method="POST">
				
				<label for="id">아이디 : </label>
				<input type="text" id="id" name="id">
			
				<br>
				
				<label for="pw">비밀번호 : </label>
				<input type="password" id="pw" name="pw">
				
				<br>
				
				<label for="name">이름 : </label>
				<input type="text" id="name" name="name">
				
				<br>
				
				<label for="hobby">취미 : </label>
				<input type="checkbox" id="hobby1" name="hobby"
				 value ="독서">독서 &nbsp;
				 <input type="checkbox" id="hobby2" name="hobby"
				 value ="영확감상">영화감상 &nbsp;
				 <input type="checkbox" id="hobby3" name="hobby"
				 value ="음악감상">음악감상 &nbsp;
				 <input type="checkbox" id="hobby4" name="hobby"
				 value ="게임">게임 &nbsp;
				 <br>
				 <button type="button" onclick="sendData(this.form)">전송</button>
		
			</form>
		</article>
	</div>
	
	<script>
		function sendData(res){
			
			res.submit();
		}
	</script>

</body>
</html>