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
	
		width: 500px;
		border-collapse: collapse;
		table th, table td {
			border: 1px solid black;
			padding: 5px;
		}	
	}
</style>
</head>
<body>
	<div id="wrap" style="margin: auto;">
		<header>
			<h1>사원 목록</h1>
		</header>
		<article>
			<table>
				<caption>사원목록</caption>
				<colgroup>
					<col width="50px">
					<col width="150px">
					<col width="*">
					<col width="100px">
				</colgroup>
				
				<thead>
					<tr>
						<th>사번</th>
						<th>이름</th>
						<th>직종</th>
					</tr>
				</thead>
					<%
						Object o = request.getAttribute("list");
						EmpVO[] list = null;
						
						if(o != null){
							list = (EmpVO[])o;
							
							for(EmpVO vo : list){
						
					%>
				
				<tbody>
						<tr>
							<td><%=vo.getEmployee_id() %></td>
							<td><%=vo.getFirst_name() %></td>
							<td><%=vo.getJob_id() %></td>
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