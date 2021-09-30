<%@page import="java.util.Calendar"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    	request.setCharacterEncoding("UTF-8");
    
    	String name = request.getParameter("name");
    	String year = request.getParameter("year");
    	// response.sendRedirect("ex2_forward.jsp");
    	
    	// 파라미터 값들 중 하나라도 받지 못했다면
    	// 앞 페이지로 이동한다. --> forwoard 연습
    	if(name == null || year == null){  	
    %>
    	<jsp:forward page = "ex2_forward.jsp"/>
    <%
    	}else{
    		// 나이 구하기
    		
    		// 년-월-일 구하기.
//    		Date date = new Date(System.currentTimeMillis());
 			
    		Calendar cal = Calendar.getInstance();
    		
    		int cYear = cal.get(Calendar.YEAR); // 년도
    		int cMonth = cal.get(Calendar.MONTH+1); // 월
    		int cDate = cal.get(Calendar.DAY_OF_MONTH); // 현재 날짜 
    	
    		// 사용자가 입력해준 보내준 생년은 문자열이므로 정수로 변환시켜주자
    		
    		int bYear = Integer.parseInt(year);
    		int age = cYear - bYear; // 2021 - Value
    		
    		// 앞 페이지로 forward 
    %>
    		<jsp:forward page="ex2_forward.jsp">
    			<jsp:param name="age" value ="<%=age %>"/>
    		</jsp:forward>
    <% 
    	}    
    %>
