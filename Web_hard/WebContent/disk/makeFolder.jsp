<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File" %>
    
    <%
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	String f_name = request.getParameter("f_name");
    	String cPath = request.getParameter("cPath");
    	
    	System.out.println("f_name result : "+ f_name);
    	System.out.println("cPath result" + cPath);
    	
    	String path = application.getRealPath("/members/"+ cPath +"/"+f_name);
  		
    	System.out.println("Path : "+path);
    	
    	File file = new File(path);
    	
    	if(!file.exists()){
    		System.out.println("폴더생성!");
    		file.mkdirs();
    	}
    
    %>
    <script>
    	// admin/hello 경로에서 jsp 폴더를 만들면 GET방식을 이용하여
    	// 경로는 admin/hello 나타나면서 즉시 폴더가 생긴다.
    	location.href= 'myDisk.jsp?cPath=<%=cPath%>';
    
    </script>