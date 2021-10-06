<%@page import="mybatis.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	request.setCharacterEncoding("UTF-8");
    %>
<jsp:useBean id="cvo" class="mybatis.vo.CommentVO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="cvo"/>
    <%
    	String cPage = request.getParameter("cPage");
    	
    	BbsDAO.addAns(cvo);
    	
    	response.sendRedirect("view.jsp?cPage"+cPage+"&b_idx="+cvo.getB_idx());
    %>
