<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String year = request.getParameter("year");
	String age = request.getParameter("age");
	
%>

<body>

	<%
		if(name == null || year == null || age == null){
			// 하나라도 밤지 못한 경우 폼을 보여줌
	%>
		<form action = "forward.jsp" method="post" name="first_form">
			<label for="name">이름:</label>
			<input type="text" id="name" name="name"><br>
			
			<label for="year">생년:</label>
			<input type="text" id="year" name="year" placeholder="2000"><br>
			<a href=javascript:test()>보내기</a>
			
			
		</form>
		
	<%
		}else{
			
	%>
		<h1>이름 :   <%=name%></h1>
		<h1>생년월일 :<%=year%></h1>
		<h1>나이 : <%=age%></h1>
	<%
		}
	%>
	<script>
		function test() {
			let year = document.getElementById('year').value;
			
			if(year.trim().length < 1){
				alert('생년월일을 입력해주세요.');
				document.getElementById('year').focus();
				return false;
			}
			document.forms[0].action ='forward.jsp';
			document.forms[0].submit();
		}
		
	</script>

</body>
</html>