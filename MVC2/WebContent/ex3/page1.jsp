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
    // 요청객체에 msg라는 이름으로 저장된 객체를 얻어내자.
	Object o = request.getAttribute("msg");
	
	String getMsg = null;
	
	if(o != null){
		getMsg = (String)o;
	}

%>
<h1>결과 :  <%=getMsg %></h1>
</body>
</html>