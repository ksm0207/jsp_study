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
	Object o = request.getAttribute("hello");
	String res = "";
	
	if(o != null){
		res = (String)o;
	}
	
%>
<h1>Result : <%=res %></h1>
</body>
</html>