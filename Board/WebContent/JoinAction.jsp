<%@page import="vo.TestUserVO"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="service.Service"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// user_id , user_pw , user_name , user_gender(array) user_email
	
	request.setCharacterEncoding("UTF-8");
	PrintWriter print_out = response.getWriter();

	String userID = request.getParameter("user_id");
	String userPassword = request.getParameter("user_pw");
	String userName = request.getParameter("user_name");
	String userGender = request.getParameter("user_gender");
	String userEmail = request.getParameter("user_email");
	
	
	Map<String,String> map = new LinkedHashMap<String,String>();
	// userID,userPassword,userName,userGender,userEmail
	
	map.put("userID", userID);
	map.put("userPassword", userPassword);
	map.put("userName", userName);
	map.put("userGender", userGender);
	map.put("userEmail", userEmail);
	
	SqlSession sql = Service.getFactory().openSession();
	TestUserVO tvo = new TestUserVO();
	
	
	if(map.put("userID",userID).isEmpty() ||
	   map.put("userPassword", userPassword).isEmpty()||
	   map.put("userName", userName).isEmpty() ||
	   map.put("userGender", userGender).isEmpty()||
	   map.put("userEmail", userEmail).isEmpty()){
		
		
		print_out.println("<script>alert('입력칸에 비어있는 항목이 있습니다.') </script>");
		print_out.println("<script>history.back()</script>");
		
	}
	
	tvo = sql.selectOne("user.check",map);
	
	boolean flag = false;
	if(tvo != null){
		
		flag = true;
		print_out.print("<script>alert('이미 존재하는 아이디 입니다.')</script>");
		print_out.println("<script>history.back()</script>");
	}
	if(!flag){
		int status = sql.insert("user.add",map);

		if (status == 1) {
			print_out.print("<script>alert('회원가입이 완료되었습니다.')</script>");
			print_out.print("<script>location.href='login.jsp'</script>");
			sql.commit();
			
		}
			
	}
	
	
	
	
	
	
			
	
	
%>