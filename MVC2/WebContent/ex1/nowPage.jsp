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
	Object o = request.getAttribute("now");
	String res = null;
	if(o != null){
		res = (String)o;
	}
%>

<h1>오늘 날짜는 <%=res %> 입니다 </h1>
</body>
</html>