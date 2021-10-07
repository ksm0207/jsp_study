<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
	    String path = application.getRealPath("/editor_img");
		
    //  UTF-8 한글처리
		MultipartRequest multipartRequest = new 
		MultipartRequest(request,path,1024*1024*5,
				"UTF-8",new DefaultFileRenamePolicy());
		
		File file = multipartRequest.getFile("file");
		System.out.println(file);
		
		// 변경전의 파일명을 담을 변수 선언
	    String o_name = multipartRequest.getOriginalFileName("file");
	   
	    
	    // 현재 파일명
	    String f_name = file.getName();
	    System.out.println(f_name);
	    
	    if(file != null){
	    	f_name = file.getName();
	    }
	  
    %>
<%-- 간단히 보는 제이슨 표기법. 
{
	"img_url" : "<%=request.getContextPath() %>/upload_img/<%=f_name%>"
}    

--%>
{
	"url" : "<%=request.getContextPath()%>/editor_img/<%=f_name%>"
}