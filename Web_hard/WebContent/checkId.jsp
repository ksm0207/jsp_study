<%@page import="mybatis.dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String id = request.getParameter("id");
	
	
	if(MemDAO.checkID(id)){
		
%>
	<pre id="chk" class="success">사용가능</pre>
<%
	}else{
%>
	<pre id="chk" class="fail">사용불가</pre>
<%
	
	}
%>