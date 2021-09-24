<%@page import="java.io.PrintWriter"%>
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
	HttpSession session2 = request.getSession();
	session2.removeAttribute("mvo");
	
	PrintWriter p_writer = response.getWriter();
	
	out.print("<script>alert('로그아웃 완료')</script>");
	out.print("<a href='main.jsp'>Home</a>");
	
%>

</body>
</html>