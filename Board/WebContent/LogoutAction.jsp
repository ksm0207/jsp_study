<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// 로그아웃 페이지 --> 이 페이지에 접속한 회원은 세션을 지워주도록 하자.
		session.invalidate();
	%>
	<script>
		alert("로그아웃");
		location.href="main.jsp";
	</script>

</body>
</html>