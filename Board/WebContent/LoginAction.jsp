<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="vo.TestUserVO"%>
<%@page import="service.Service"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 요청시 한글처리 해주는 메소드 
	request.setCharacterEncoding("UTF-8");
	PrintWriter print_out = response.getWriter();
	
	// user_id , user_pw
	String user_id = request.getParameter("user_id");
	String user_pw = request.getParameter("user_pw");
	
	// user.xml안에 login mapper를 호출하기 위한 Map구조를 만들어준다. 즉 데이터 전송이 이루어져야함.
	Map<String,String> map = new LinkedHashMap<String,String>();
	map.put("userID",user_id);
	map.put("userPassword",user_pw);
	
	// mapper 호출하기 위한 SqlSession 객체 생성
	SqlSession sql = Service.getFactory().openSession();
	
	// login mapper를 호출하기 -> login 쿼리 참조.
	TestUserVO tvo = sql.selectOne("user.login",map);
	
	
	
	if(tvo != null){
		
		session.setAttribute("tvo", tvo);
		response.sendRedirect("main.jsp");
		
	}else{
		print_out.print("<script>alert('아이디 혹은 비밀번호가 틀립니다.')</script>");
		print_out.print("<script>history.back()</script>");
	}
%>    