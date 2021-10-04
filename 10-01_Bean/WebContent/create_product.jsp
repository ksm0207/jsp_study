<%@page import="java.io.PrintWriter"%>
<%@page import="mybatis.dao.ShopDAO"%>
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

	
	String category = req.getParameter("category");
	String p_num = req.getParameter("p_num");
	String p_name = req.getParameter("p_name");
	String p_company = req.getParameter("p_company");
	String p_price = req.getParameter("p_price");
	String p_saleprice= req.getParameter("p_saleprice");
	String p_image_s = req.getFilesystemName("p_image_s");
	String p_content = req.getParameter("p_content");
	
	String original_img = req.getOriginalFileName("p_image_s");
	
	
	PrintWriter writer = response.getWriter();
	
	int insert = ShopDAO.createProduct(category, p_num, p_name, p_company, p_price, p_saleprice, p_content, p_image_s);
	
	
	if (insert == 1){
		writer.print("<script>alert('add success')</script>");
	}
	

%>

<%-- 
<h1>카테고리 : <%=category%></h1>
<h1>제품번호 : <%=p_num%></h1>
<h1>제품이름 : <%=p_name%></h1>
<h1>제조회사 : <%=p_company%></h1>
<h1>제품가격 : <%=p_price%></h1>
<h1>할인가격 : <%=p_saleprice %></h1>
<h1>이미지s : <%=p_image_s%></h1>
<h1>제품내용 : <%=p_content%></h1>
--%>
