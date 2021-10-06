<%@page import="mybatis.dao.BbsDAO"%>
<%@page import="mybatis.vo.BbsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 만들기</title>
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
	
	#bbs table th,#bbs table td {
	    text-align:center;
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
	
	/* paging */
	
	table tfoot ol.paging {
	    list-style:none;
	}
	
	table tfoot ol.paging li {
	    float:left;
	    margin-right:8px;
	}
	
	table tfoot ol.paging li a {
	    display:block;
	    padding:3px 7px;
	    border:1px solid #00B3DC;
	    color:#2f313e;
	    font-weight:bold;
	}
	
	table tfoot ol.paging li a:hover {
	    background:#00B3DC;
	    color:white;
	    font-weight:bold;
	}
	
	.disable {
	    padding:3px 7px;
	    border:1px solid silver;
	    color:silver;
	}
	
	.now {
	   padding:3px 7px;
	    border:1px solid #ff4aa5;
	    background:#ff4aa5;
	    color:white;
	    font-weight:bold;
	}
		
</style>
</head>
<body>
	<div id="bbs">
		<table summary="게시판 목록">
			<caption>게시판 목록</caption>
			<thead>
				<span>전체 게시물 수 : <%=BbsDAO.getTotalCount() %></span>
				<tr class="title">
					
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			
			
			<tfoot>
                      <tr>
                          <td colspan="4">
                              <ol class="paging">
         <!-- 페이징 기법 처리 -->
         
         <%
            
         	int nowPage = 1 ;    // 현재 페이지 
         	int numPerPage = 10; // 한 페이지당 보여질 게시물 수
         	
         	// 페이징을 위한 변수 선언      	
         	
         	int totalRecord = BbsDAO.getTotalCount(); // 총 게시물 수 21
         	int pagePerBlock = 5; // 한 페이지 <a> 요소에 보여질  한 블럭 (페이지 묶음)
         	
         	// 전체 페이지 수 구해주기
         	int totalPage =0;
         	/*
	         	totalPage = totalRecord / numPerPage; // 예 : 103 / 5 ==> 20
	         	
	         	if(totalRecord % numPerPage != 0){
	         		totalPage ++;
	         	}
         	*/
         	// 위 방법도 좋지만 Math클래스에 ceil 함수를 사용해보자.
         	
         	// Math.ceil() : 소수점을 가장 가까운 높은 정수로 전환하는 기능을 가짐.
         	// 몫을 구하고 나머지 +1
         	totalPage = (int)Math.ceil((double)totalRecord / numPerPage);
         	
         	// 현재 페이지 값을 파라미터로 받기. 받은 후 nowPage 변수에 넣음. c_nowPage =>1
         	// 만약 파라미터 값이 없다면 nowPage의 값을 그대로 사용함.-> 첫번째 페이지를 보겠다는 뜻
         	
         	String cPage = request.getParameter("cPage");
         	
         	if(cPage != null){
	         	nowPage = Integer.parseInt(cPage);   
	         	
	         	// 만약 : 현재 페이지 값(nowPage)이 총 페이지 값(totalPage)
	         	// 을 넘어선다면 어떻게 처리할까?
	         			
	         	if(nowPage > totalPage){
	         		nowPage = totalPage; // 마지막 페이지를 보여주기
	         	}	
	         
         	}
         	
         	// 이제 각 페이지의 시작(begin) 과 끝 (end) 을 지정해주도록 하자.
         	// 현재 페이지가 1 일때 : begin (1) , end : 5
         	// 현재 페이지가 2 일때 : begin (6) , end : 10
         	// 현재 페이지가 3 일때 : begin (11) , end : 15
         	// 현재 페이지가 4 일때 : begin (16) , end : 20
         	
         	// 전체레코드 수 : 21 일때
         	// 1. 페이지의 시작번호 : 1
         	// 2. 페이지의 마지막 : 5 가 됨.
         	int begin = (nowPage - 1 )*numPerPage +1; // 한 페이지의 보여질 첫 시작
         	int end = nowPage - numPerPage; // 페이지의 마지막 번호 
         	
         	// 현재페이지 값에 의해 블럭의 시작페이지 값 구하기
         	int startPage = (int)((nowPage -1) / pagePerBlock) * pagePerBlock + 1;
         	
         	// 블럭의 마지막 페이지 값 구하기
         	int endPage = (startPage + pagePerBlock) -1;
         	
         	// 총 페이지 수가 endPage보다 작다면 .. 총 페이지 수를 넘어 표현되는범위를 막아준다.
         	// 결론 : endPage가 totalPage보다 크면안됨.
         	
         	if(endPage > totalPage){
         		endPage = totalPage;
         	}
         	
         	// 이전블럭으로 이동하는 여부는 startPage가 1보다 클때를 의미함
         	// startPage => 1 , 6 , 11 , 16 ..
         	// 또는 startPage가 pagePerBlock보다 작다면 이전으로 기능을 막아야함
         	
         	if(startPage < pagePerBlock){
         	
         %>
         	<li class="disable">&lt;</li>
         <%
         	}else{
         %>                         
            

			<li><a href="list.jsp?cPage=<%=startPage - pagePerBlock %>">&gt;</a></li>
<%
      		}
         	for(int i= startPage ; i <= endPage ; i ++){
				
         		if(nowPage == i){
%>
				<li class="now"><%=i %></li>
<%
       			}else{  	
%>	
				<li><a href="list.jsp?cPage=<%=i%>"><%=i %></a></li>	
<%
       			}
         	}
         	
         	// 다음 블록으로 이동하는 기능을 부여해야 할지 말아야할지
         	// endPage가 totalPage보다 작을 경우에만 부여하도록 하기
         	
         	if(endPage < totalPage){
%>
			<li><a href="list.jsp?cPage=<%=startPage + pagePerBlock%>">&gt;</a></li>
<%
         	}else{
%>
				<li class="disable">&gt;</li>
<%
         	}
%>
		
	
                              </ol>
                          </td>
						  <td>
							<input type="button" value="글쓰기"
			onclick="javascript:location.href='write.jsp'"/>
						  </td>
                      </tr>
                  </tfoot>
			<tbody>
				<!-- 쿼리문 내용 출력부분 -->
				<%
					
					// 1. 게시물 목록을 가져오기
					BbsVO[] ar = BbsDAO.getList(1,10);
					
					if(ar != null){
						for(int i=0; i < ar.length; i++){
						BbsVO bvo = ar[i];
				%>
				
				<tr>
					<td><%=bvo.getB_idx()%></td>
					<td style="text-align: left">
						<a href="view.jsp?cPage=<%=nowPage%>&b_idx=<%=bvo.getB_idx()%>">
						<%=bvo.getSubject() %>
					</a></td>
					<td><%=bvo.getWriter()%></td>
					<td>
						<%
							if(bvo.getWrite_date() != null){	
						%>
							<%=bvo.getWrite_date().substring(0,10) %>
						<%
							}
						%>
					</td>
					<td><%=bvo.getHit()%></td>
				</tr>
			<%
						}
				}
			%>
			</tbody>
		</table>
		
	</div>
</body>
</html>