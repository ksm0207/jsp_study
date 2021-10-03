<%@page import="mybatis.vo.ProductVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<jsp:useBean id="cart" class="shop.bean.Cart" scope="session"/>
	
	<%
		int total = 0;
		ProductVO[] vo = cart.getList();
	%>
	
	<table width="600" border="1" align="center" 
        style="border-collapse:collapse;font-size:8pt" cellspacing="0" 
               cellpadding="4">
               <tr>
                   <td colspan="6">:: 장바구니 내용</td>
               </tr>
               <tr bgcolor="#dedede">
                   <th>제품번호</th>
                   <th width="25%">제품명</th>
                   <th>단가</th>
                   <th>수량</th>
                   <th>금액</th>
                   <th>삭제</th>
               </tr>

	<%
		if(vo != null){
			for(ProductVO pvo : vo){
				
			
	%>
            <tr align="center">
                <td><%=pvo.getP_num() %></td>
                <td><%=pvo.getP_name() %></td>
                <td>
                    정가:<%=pvo.getP_price() %><br>
                    <font color="red">
                        세일가격:<%=pvo.getP_saleprice() %>
                    </font>
                </td>
                <td>
                    <!-- 수량 조정 폼 -->
                    <form action="changeCount.jsp" method="POST">
                    	<input type="hidden"
                    	       value="<%=pvo.getP_num() %>"
                    	       name="p_num"/>
                    	       
                    	<input type="number"
                    	       value="<%=pvo.getQuant()%>"
                    	       name="count"
                    	       size="2">
                    	<input type="submit" value="수정">	              
                    </form>
                    <!------------------>
                </td>
                <td><%=pvo.getTotalPrice() %></td>
                <td>
                    <input type="button" value="삭제" 
                    style="border:1 solid black;cursor:pointer" 
onclick="javascript:location.href='delProduct.jsp?p_num=<%=pvo.getP_num()%>'">
                </td>
            </tr>
	
	<%
			total += pvo.getTotalPrice();
		  }
			
		}else{
	%>
	    <tr align="center">
                <td colspan="6">
                    <b>장바구니가 비었습니다.</b>
                </td>
            </tr>
<%
		}	
%>    
            <tr>
                <td colspan="5" align="right">총 결재액 : <%=total %>원 </td>
                <td></td>
            </tr>
    
        </table>
	

</body>
</html>