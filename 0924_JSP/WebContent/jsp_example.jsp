<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int count = 10;
	System.out.println(count);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
	<%
		for(int i=0; i<count; i++){
			
	%>
		<h1>제목</h1>
	<%
		}
	%>	
	</header>

</body>
</html>