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
	Object o = request.getAttribute("movie");
	String msg = null;
	if(o != null){
		msg= (String)o;
	}
%>
<h1>결과 입니다 : <%=msg %></h1>
</body>
</html>