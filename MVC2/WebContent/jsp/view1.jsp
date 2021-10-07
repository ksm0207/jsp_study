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
	// MVC 환경은 View에 해당되는 페이지로 이동 시 For-ward 형식으로온다.
	// 즉 request에 '저장한' 값들을 사용할 수 있음
	
	Object obj = request.getAttribute("msg");
	
	String msg = null;
	if(obj != null){
		msg = (String)obj;
	}
%>
	<h1><%=msg %>View1.jsp </h1>
</body>
</html>