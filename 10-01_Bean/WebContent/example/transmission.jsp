<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	request.setCharacterEncoding("UTF-8");
	
	// UseBean 활용 1 -> request.getParameter 메소드 대신 VO객체로 값 저장하기
	/*
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String[] hobby = request.getParameterValues("hobby");
	
	*/
    
    	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- String id = request.getParameter("id)
		 TestVO tvo = new TestVO();
		 tvo.getId('value')
		 위 세단계 방법을 UseBean을 이용하면 깔끔하게 데이터를 관리할 수 있다
		 단 UseBean에서는 파일첨부가 불가능함.
	 -->
	
	<!-- useBean 활용 2 Vo객체 활용하기. -->
	<jsp:useBean id="vo" class="ex2.TestVO" scope="page"/>
	
	<!-- property : 이름이 id를 가리키는 객체의 멤버변수명 | name : useBean의 id이름을 의미함-->
	<!-- param : 현재페이지로 전달 할 파라미터이름 -->
	
	<!-- <jsp:setProperty property="id" name="vo" param="id"/> -->
	<!-- setProperty는 set멤버변수 = setId() = setter를 의미함 -->
		
	<!-- ※ property 와 param이 같으면 param을 생략 할 수 있다 -->
	
	<%-- 
		<jsp:setProperty property="id" name="vo" param="id"/>
		<jsp:setProperty property="pw" name="vo"/>
		<jsp:setProperty property="name" name="vo"/>
		<jsp:setProperty property="hobby" name="vo"/>
	--%>
	
	<!-- 여러개의 변수를 처리할때는 property에 *을 주자 -->
	<jsp:setProperty property="*" name="vo"/>
	
	<h1><%=vo.getId()%></h1>
	<h1><%=vo.getPw()%></h1>
	<h1><%=vo.getName()%></h1>
	
	<ul>
		<% 
			for(String hobby : vo.getHobby()){
		
		%>
			<h1><%=hobby %></h1>

		<%
			}
		%>
	</ul>
	
	
</body>
</html>