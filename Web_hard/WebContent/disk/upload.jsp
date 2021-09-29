<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    	// 첨부된 파일을 서버에서 받기위해 라이브러리를 사용하자 - cos.jar
  		// 주의 : enctype=multipart/form/data 로 되어있다면
  		//       request 로 받을 수 없음 받으면 null값뜸.
  		
    //	String dir = request.getParameter("cPath");
    //	String upload = request.getParameter("upload");
    
    // 세션 값 가져오기.
    String getDir = (String) session.getAttribute("dir");
    // 절대 경로 생성
    String realPath = application.getRealPath("/members/"+getDir);
	
    System.out.println(realPath);
    // cos 라이브러리 객체 생성 - 객체생성만 해도 전달된 파일이 절대경로에 저장됨.
    MultipartRequest multipartRequest = new 
    		MultipartRequest(request,realPath,1024*1024*5,
    				new DefaultFileRenamePolicy());

     
    // 서버에 저장된 파일명이 변경될 수 있으므로 변경된 내용이 있으면 체크해주기 !
    File file = multipartRequest.getFile("upload");
    
    // 변경전의 파일명을 담을 변수 선언
    String o_name = multipartRequest.getOriginalFileName("upload");
    
    // 현재 파일명
    String f_name = file.getName();
   //  response.sendRedirect("myDisk.jsp?realPath="+realPath);
%>
	<script>
		alert('업로드 완료!');
		location.href= 'myDisk.jsp?cPath=<%=getDir%>'
	</script>