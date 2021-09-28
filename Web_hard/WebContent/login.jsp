<%@page import="java.io.PrintWriter"%>
<%@page import="mybatis.dao.MemDAO"%>
<%@page import="mybatis.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	String id = request.getParameter("u_id");
    	String pw = request.getParameter("u_pw");
    	
    	System.out.println("아이디 : " + id);
    	System.out.println("비번 : " + pw);
    	
    	PrintWriter writer = response.getWriter();
    	
    	MemVO mvo = MemDAO.login(id, pw);
    	
    	if(mvo != null){
	    	session.setAttribute("mvo", mvo);
	    	writer.print("<script>parent.location.href='index.jsp'</script>");    		
    	}
    	
   
    
    %>
