<%@page import="mybatis.vo.EmpVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
	
		width: 600px;
		border-collapse: collapse;
	
	}
	table th, table td {
		border: 1px solid black;
		padding: 5px;
	}	
	table caption {
		text-indent: -9999px;
	}
	#add_popup{
		display: none;
	}
	#search_popup{
		display : none;
	}
</style>
</head>
<body>
	<div id="wrap" style="margin: auto;">
		<header>
			<h1>검색결과</h1>
		</header>
		<article>
			<table>
				<caption>사원목록</caption>
				
				<colgroup>
					<col width="50px"/>
					<col width="150px"/>
					<col width="*"/>
					<col width="100px"/>
					<col width="100px"/>
					<col width="50px"/>
				</colgroup>
				
				<thead>
					<tr>
						<td colspan="7">
							<h1 style="text-align: center">검색 결과 입니다.</h1>
						</td>
					</tr>
					<tr>
						<th>사번</th>
						<th>이름</th>
						<th>성씨</th>
						<th>이메일</th>
						<th>직종</th>
						<th>입사일</th>
						<th>부서코드</th>
					</tr>
				</thead>
				
				
				<tbody>
				<%
					// 컨트롤러에서 forward 방식으로 이동온다
					// request에 저장된 정보들 중 "ar" 이라는 이름으로
					// 저장된 정보를 얻어보자
					Object o = request.getAttribute("list");
					EmpVO[] ar = null;
					if(o != null){
						ar = (EmpVO[])o;
					
					for(EmpVO vo : ar){
				%>
					<tr>
						<td><%=vo.getEmployee_id() %></td>
						<td><%=vo.getFirst_name() %></td>
						<td><%=vo.getLast_name() %></td>
						<td><%=vo.getEmail() %></td>
						<td><%=vo.getJob_id() %></td>
						<%
							if(vo.getHire_date() != null){
						%>
							<td><%=vo.getHire_date().substring(0,10) %></td>
						<%
							}
						%>
						<td><%=vo.getDepartment_id() %></td>
						
					</tr>
				<%
						}
					}
				%>
				
				</tbody>
			</table>
		</article>
	</div>

</body>
</html>