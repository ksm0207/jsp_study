<%@page import="mybatis.dao.BbsDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
	request.setCharacterEncoding("UTF-8");
	
	String path = application.getRealPath("/upload");

	
	MultipartRequest req = new 
			MultipartRequest(request,path,1024*1024*5,
					"UTF-8",new DefaultFileRenamePolicy());
	
	String title = req.getParameter("title");
	String writer = req.getParameter("writer");
	String content = req.getParameter("content");
	String file = req.getFilesystemName("file");
	String ip = request.getRemoteAddr();
	String pwd = req.getParameter("pwd");
	System.out.println("Password : "+pwd);
	
	
	int insert = BbsDAO.createData(title, writer, content, file,ip,pwd);
	
	if(insert == 1){
		out.print("<script>alert('add Success!')</script>");
	}
%>

<!-- list.jsp를 호출하면서 cPage값을 주지 않으면 현재페이지가 1이되므로. 현재 작성한 게시물을 보이도록함. -->
<script>
	location.href='list.jsp';
</script>
