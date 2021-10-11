<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원가입 페이지 - sign_up.jsp</h1>

<div>
	<form action="MemberController" method = "GET">
			
		<label>ID : </label>
		<input type="text" name = "id"><br>
		
		<label>PW: </label>
		<input type="text" name = "pw"><br>
	
		<label>Name : </label>
		<input type="text" name = "name"><br>
		
		<label>Phone : </label>
		<input type="text" name = "phone" placeholder="- 빼고 입력해주세요."><br>
		<input type="hidden" name = "search" value ="signUp">
		<button type="submit">가입</button>
	</form>
	
</div>



</body>
</html>