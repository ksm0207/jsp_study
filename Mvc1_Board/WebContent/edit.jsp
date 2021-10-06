<%@page import="mybatis.dao.BbsDAO"%>
<%@page import="mybatis.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    	String b_idx = request.getParameter("b_idx");
    	String cPage = request.getParameter("cPage");
    	
    	int parsing = Integer.parseInt(b_idx);
    	
    	BbsVO bvo = BbsDAO.search(parsing);
    	
    	
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#bbs table {
	    width:580px;
	    margin-left:10px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	
	.odd {background:silver}
	
		
</style>

</head>
<body>

<div id="bbs">
	
	<form action="edit_ok.jsp?cPage=<%=cPage%>&b_idx=<%=bvo.getB_idx() %>" method="post">
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" value="<%=bvo.getSubject() %>" name="title" size="45"/></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input type="text" value="<%=bvo.getWriter() %>" name="writer" size="12"/></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td>
					<textarea name="content" cols="50" 
							rows="8"><%=bvo.getContent() %> </textarea>
							
					</td>
				</tr>
				<tr>
					<th>비밀번호:</th>
					<td><input type="password" value=<%=bvo.getPwd() %> name="pwd" size="12"/></td>
				
					
				</tr>
				
<!--
				<tr>
					<th>비밀번호:</th>
					<td><input type="password" name="pwd" size="12"/></td>
				</tr>
-->

				<tr>
					<td colspan="2">
						<input type="submit" value="보내기"
						onclick="javascript:location.href='edit_ok.jsp'"/>
						<!--  
							<input type="button" value="다시"/>
							<input type="button" value="목록"/>
						-->
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>

</body>
</html>