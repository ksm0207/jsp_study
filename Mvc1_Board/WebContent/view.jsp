<%@page import="java.util.List"%>
<%@page import="mybatis.vo.CommentVO"%>
<%@page import="mybatis.vo.BbsVO"%>
<%@page import="mybatis.dao.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<%
		String index = request.getParameter("b_idx");
		
		// cPage : 원래 페이지로 돌아가기위한 변수
	    String cPage = request.getParameter("cPage");
		

		BbsDAO.setBoardHit(index);
		
		int b_idx = Integer.parseInt(index);
		
		if(b_idx > 0){
			BbsVO bvo = BbsDAO.search(b_idx);
			
	
%>
	<div id="bbs">
	<form method="post" >
		<table summary="게시판 글쓰기">
			<caption>게시판 글쓰기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><%=bvo.getSubject()%></td>
				</tr>
						<%
							if(bvo.getFile_name() != null && bvo.getFile_name().length() > 4){
								
							
						%>
				<tr>
					<th>첨부파일:</th>
					<td><a href="javascript: download('<%=bvo.getFile_name() %>')">
						<%=bvo.getFile_name() %>
					</a></td>
				</tr>
					<%
						}
					%>
				<tr>
					<th>이름:</th>
					<td><%=bvo.getWriter() %> </td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><%=bvo.getContent() %></td>
				</tr>
				
				<tr>
					<td colspan="2">
						<input type="button" value="수정" onclick="javascript:location.href='edit.jsp?cPage=<%=cPage%>&b_idx=<%=bvo.getB_idx()%>'"/>
						
						<input type="button" value="삭제"/>
						<input type="button" value="목록" onclick="goList();"/>
					</td>
				</tr>
			</tbody>
		</table>
	</form>

	<!-- 원글을 의미하는 원글의 기본키 -->
	<form method="post" action="ans_write.jsp">
		이름:<input type="text" name="writer"/><br/>
		내용:<textarea rows="4" cols="55" name="content"></textarea><br/>
		비밀번호:<input type="password" name="pwd"/><br/>
		<input type="hidden" name="b_idx" value="<%=bvo.getB_idx()%>">
		<input type="hidden" name="cPage" value="<%=cPage%>">
		<input type="submit" value="저장하기"/> 
	</form>
	
	댓글들<hr/>
	
	<%
		List<CommentVO> c_list = bvo.getCvo_list();
		for(CommentVO cvo : c_list){
	
	%>
	
		<div>
			이름:<%=cvo.getWriter() %> &nbsp;&nbsp;
			날짜:<%=cvo.getWrite_date() %><br/>
			내용:<%=cvo.getContent() %>
		</div>
	</div>
	<%
		}
	%>
	<form name="frm" method="POST">
		<input type="hidden" name="cPage" value="<%=cPage%>">
		<input type="hidden" name="b_idx" value="<%=bvo.getB_idx()%>">
	</form>
	<%
		}else{
			response.sendRedirect("list.jsp");
	%>
			
	<%
		}
	%>
	
	<script>
		function goList(){
			location.href='list.jsp?=<%=cPage%>';
		}
	</script>
	
</body>
</html>