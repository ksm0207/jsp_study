<%@page import="java.io.PrintWriter"%>
<%@page import="service.Service"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Map"%>
<%@page import="vo.TestUserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	HttpSession session2 = request.getSession();
	TestUserVO tvo = (TestUserVO) session2.getAttribute("tvo");

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	String available = request.getParameter("available");
	
	available = "0";
	
	Map<String,String> map = new LinkedHashMap<String,String>();
	
	map.put("title",title);
	map.put("userid",tvo.getUserID());
	map.put("content",content);
	map.put("available",available);
	
	SqlSession sql = Service.getFactory().openSession();
	
	int status = sql.insert("board.add",map);
	
	PrintWriter writer = response.getWriter();
	
	if(status == 1){
		writer.print("글쓰기 성공");
		sql.commit();
	}

	

	
%>