<%@page import="mybatis.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 페이지</h1>
	<%
		Object o = request.getAttribute("user");
		MemberVO mvo = (MemberVO)o;
		if(mvo != null){	
	%>
		<h1><%=mvo.getMember_name() %> 님 안녕하세요 ? </h1>
	<%
		}else{
	%>
		<h1>유저를 출력하세요</h1>
		<form action="MemberController" method="POST">
			<label>ID :</label>
			<input type="text" name = "id"><br>
			
			<label>PW :</label>
			<input type="text" name = "pw"><br>
			<input type="hidden" name="search" value="login">
			<button type="submit">로그인</button>
		</form>
	<%
		}
	%>

</body>
</html>