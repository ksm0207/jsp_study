<%@page import="vo.MemVO"%>
<%@page import="java.io.PrintWriter"%>
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
	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	PrintWriter out2 = response.getWriter();
	
	if(id.equals("admin") && pw.equals("1234")){
		
		MemVO mvo = new MemVO(id,"관리자","ksm03071@gmail.com");
		HttpSession session2 = request.getSession();
		session2.setAttribute("mvo", mvo);
		
		out2.print("1");
	}else{
		out2.print("0");
	}
	out2.close();
%>

</body>
</html>