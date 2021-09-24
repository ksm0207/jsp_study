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
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String name = request.getParameter("name");
	String[] hobby = request.getParameterValues("hobby");
	
%>
	<h2>이름 :<%=name%></h2>
	<h2>취미 :</h2>
	
	<% 
		for(int i=0; i<hobby.length; i++){ 
	%>
	
	<h2><%=hobby[i] %></h2>

	<%
		}
	%>

</body>
</html>