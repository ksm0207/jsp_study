<%@page import="mybatis.dao.BbsDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
<%
	request.setCharacterEncoding("UTF-8");
	String b_idx = request.getParameter("b_idx");
	
	String cPage = request.getParameter("cPage");
	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	
	System.out.println("Edit_ok : B_Idx : "+ b_idx);
	System.out.println("Edit_ok : B CPage : "+ cPage);
	
	int res = BbsDAO.updateBoard(title, writer, content,b_idx,pwd);
	
	if(res > 0){
		response.sendRedirect("view.jsp?cPage="+cPage+"&b_idx="+b_idx);
	}

%>

<!-- list.jsp를 호출하면서 cPage값을 주지 않으면 현재페이지가 1이되므로. 현재 작성한 게시물을 보이도록함. -->
<!--  
<script>
	location.href='list.jsp';
</script>
-->
