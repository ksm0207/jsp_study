<%@page import="vo.MemVO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
	$(function(){
		
		$("#login").on("click",function(){
			
			let id = $("#id").val();
			let pw = $("#pw").val();
			
			let user_data = {id,pw};
			
			$.ajax({
				
				url : "login.jsp",
				data : user_data,
				method : "POST",
			})
			.done(function(data){
				
				if(data =="0"){
					location.href="main.jsp";
				}
				
				if(data == "1"){
					location.href="main.jsp";
				}
			});
		});
		
		$("#logout").on("click",function(){
			location.href= "logout.jsp";
		});
		
		
	});
</script>
</head>
<body>

<%

	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	HttpSession h_session = request.getSession();
	
	MemVO mvo =(MemVO) h_session.getAttribute("mvo");

%>

<%
	if (mvo == null){
%>
	<label>ID :</label>
	<input type="text" id="id" name="id"><br>
	
	<label>PW :</label>
	<input type="text" id="pw" name="pw"><br>
	
	<input type="button" id="login" value="로그인"><br>
	
<%
	}else{
%>
	<span><%=mvo.getName()%>님 안녕하세요? </span>
	<input type="button" id="logout" value="로그아웃">
	
<% } 

%>


</body>
</html>