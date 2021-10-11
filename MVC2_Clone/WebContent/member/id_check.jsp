<%@page import="mybatis.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html; charset=UTF-8");
	
	String id = request.getParameter("id");
	
	
	if(MemberDAO.checkID(id)){
		
%>
	<pre id="chk" class="success">사용가능한 아이디 입니다.</pre>
<%
	}else{
%>
	<pre id="chk" class="fail">이미 사용중인 아이디 입니다.</pre>
<%
	
	}
%>