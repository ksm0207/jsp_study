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
	Object obj = request.getAttribute("seoul");
	
	String res = "";
	
	if(obj != null){
		res = (String)obj;
	}
	
%>
<h1>  검색 : "<%=res %>"</h1>
</body>
</html>