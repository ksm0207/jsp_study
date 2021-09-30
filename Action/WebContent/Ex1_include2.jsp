<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	
	<div id="header">
		<!-- 1 번 같은 경우는 page="ex1_menu.jsp" 파일을 미리 Parsing 처리를 끝내 놓고
		     Ex1_include2.jsp 파일이 Parsing이 끝나고 난 뒤에 ex1_menu.jsp를 포함시킬 수 있음
		          단 자바코드는 포함할 수 없음 -->
		<!-- 2번 같은 경우 include 지시자만 사용하면 포함하고 있는 jsp를 모두 포함시킬 수 있다
		               (자바 코드 포함) -->
		               
		<%-- (1) <jsp: page="ex1_menu.jsp"></jsp:include> --%>
		<%-- (2) <%@ include file="ex1_menu.jsp" %> --%> 
		<%@ include file="ex1_menu.jsp" %>
		
		
	</div>
	
	<h1><%=name%></h1>
</body>
</html>