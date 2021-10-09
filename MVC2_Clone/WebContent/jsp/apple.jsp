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
	Object obj = request.getAttribute("apple");
	
	String res = "";
	
	if(obj != null){
		res = (String)obj;
	}
%>
<h1>Result : <%=res %></h1>

</body>
</html>