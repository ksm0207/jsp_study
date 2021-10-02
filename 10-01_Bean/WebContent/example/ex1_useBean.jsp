<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- useBean : 마이바티스 구조와 비슷함. -->
	<!-- id : 변수명 이고 class는 자료형을 뜻함. -->
	<!-- 자바 방식 : Count value = new Count(); 와 같음 -->
	
	<!-- scope : scope는 현재 페이지의 사용범위를 뜻한다. --> 
	
	<!-- scope : "page" 현재 페이지에서 사용하고 사라짐. 사용한 객체는 다른페이지에서 사용못함 -->
	<!-- request : 현재 페이지에 있다가 다른페이지로 이동할때 소멸됨. ※ forward는 그대로 남아있음. -->
	<!-- session : 카운트를 세션에 저장 기존 세션개념과 같음 .
	                              다른 브라우저에서 접속하면 새로운 세션을 저장함 !-->
	<!-- application : static 개념과 같다 , 서블릿 Context와 같고 서버를 닫으면 값이 소멸됨
					      즉 값을 계속 누적되며 소멸시키는 방법은 서버를 닫는 즉시 소멸된다.
	 -->
	
	<jsp:useBean id="getValue1" class="ex1.Count" scope="page"/>
	<jsp:useBean id="getValue2" class="ex1.Count" scope="session"/>
	<jsp:useBean id="getValue3" class="ex1.Count" scope="application"/>
	
	<!-- count 값을 1씩 증가하는지 테스트를 진행하였고 , scope를 통해 결과가 어떻게 나오는지 확인 -->
	<%
		getValue1.inc();
		getValue2.inc();
		getValue3.inc();
	%>
	<!-- scope로 정해준 값에 따른 결과 출력 -->
	<h1>ex1_userBean.jsp</h1>
	
	<h1>useBean getValue1  scope Property "page" <%=getValue1.getCount()%></h1>
	<h1>useBean getValue2  scope Property "session" <%=getValue2.getCount()%></h1>
	<h1>useBean getValue3  scope Property "application" <%=getValue3.getCount()%></h1>
	
	<!-- 페이지 이동 - scope로 정해준 값에 따라 어떻게 돌아가는지 확인하기.  -->
	<!-- 확인 결과는 ex2_userBean.jsp에서 확인하기 -->
	<a href="ex2_useBean.jsp">ex2_useBean.jsp 이동</a>
	

</body>
</html>