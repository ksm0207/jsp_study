<%@page import="java.io.File"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="ex3.dao.MemDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
    <%
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html; charset=UTF-8");
    	
    	String id = request.getParameter("id");
    	String pw = request.getParameter("pw");
    	String name = request.getParameter("name");
    	String email = request.getParameter("email");
    	
    	int res = MemDAO.registry(id, pw, name, email);
    	
    	PrintWriter writer = response.getWriter();
    	
    	if (res == 1){
    		writer.print("<script>alert('회원가입 완료 !')</script>");
    		writer.print("<script>parent.location.href='index.jsp'</script>");
    	
    		// 회원가입이 성공하면 members 폴더에 회원 아이디와 같은 폴더를 생성하자.
    		
    		// 1.현재 서버의 members 폴더에 정확한 절대경로를 얻어내기
    		// application : 현재 프로그램 이름 || Project Name
    		// getRealPath() 절대경로
    		// : / Webcontent
    		// +id 회원가입 한 사용자 아이디
    		String path = application.getRealPath("/members/"+id);
 			//System.out.println("getRealPath : "+path);
    		File file = new File(path);
    		
    		// 2. 파일이 존재하지 않을 경우 디렉토리를 생성해주기.
    		if(!file.exists()){
    	    // 경로 : 내 카톡 대화명 확인
    			file.mkdirs();
    		}
    	}
 
    %>