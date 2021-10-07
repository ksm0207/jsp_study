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

<!-- summer note -->
<link rel="stylesheet" href="./css/summernote-lite.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="./js/summernote-lite.js"></script>
<script src="./js/lang/summernote-ko-KR.js"></script>
<!-- end -->

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
	.disable{background:#efefef; border: 1px soild #efefef;}
		
</style>

</head>
<body>

<div id="bbs">
	
	<form action="edit_ok.jsp?cPage=<%=cPage%>&b_idx=<%=bvo.getB_idx() %>" method="post">
		<table summary="게시판 글쓰기">
			<caption>게시판 수정</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td><input type="text" value="<%=bvo.getSubject() %>" name="title" size="45"/></td>
				</tr>
				<tr>
					<th>이름:</th>                                       <!--readonly 속성은 값을 수정하지 못하지만 파라미터 전달이 가능함  -->
					<td><input type="text" value="<%=bvo.getWriter() %>"  readonly="readonly" class="disable"  name="writer"  size="12"/></td>
				</tr>                                                   <!-- disabled 속성은 readonly와 비슷하지만 파라미터 전달이 X -->
				<tr>
					<th>내용:</th>
					<td>
					<textarea id="content" name="content" cols="50" 
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
	
	<script>
	
	$(function(){
		$("#content").summernote({
			lang: "ko-KR",
			width:500,
			height:200,
			minHeight:200,
			maxHeight:400,
		});
	})
	</script>

</body>
</html>