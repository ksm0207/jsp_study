<%@page import="mybatis.vo.ProductVO"%>
<%@page import="shop.bean.ShopBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>

<%
	request.setCharacterEncoding("UTF-8");

%>

<!-- userBean : 처음에는 값이 없음 -->

<jsp:useBean id="shop" class="shop.bean.ShopBean" scope="session"/>
<!-- setProperty 값을 넣었을때 UseBean 에서는 다시 값이 생김 -->

<jsp:setProperty property="category" name="shop"/>

<%
	shop.searchProduct(); // 사용자가 선택한 카테고리별 제품들이 검색되었음.
	                           // 쿼리결과를 호출함.
   	                           
	
    ProductVO[] p_list = shop.getP_list();
	System.out.println("ProductVO[] list = " + p_list);
%>
	<table align="center" width="600" border ="1" style="border-collapse:collapse;
	       font-size:11px bordercolor="navy" cellpadding="4" cellspacing="0">
	       
	       <colgroup>
	       		<col width="10%">
	       		<col width="10%">
	       		<col width="35%">
	       		<col width="20%">
	       		<col width="25%">
	       </colgroup>
		<thead>
			<tr>
				<th>제품번호</th>
				<th>이미지</th>
				<th>제품명</th>
				<th>제품가격</th>
				<th>비고</th>
			</tr>
		</thead>
		
		<tbody>
			
			<%
				if(p_list != null){
					for(ProductVO pvo : p_list){		
			%>
					<tr align="center">
						<td><%=pvo.getP_num()%></td>
						<td><img src="images/<%=pvo.getP_image_s()%>"
						     width="60px" height="50px">
						</td>
						
						<td><a href="product_content.jsp?prod_num=<%=pvo.getP_num()%>">
						  	<%=pvo.getP_name() %>
						 </a></td>
						<td>할인가 : <%=pvo.getP_saleprice()%> 원 <br>
							<font color="red">(<%=pvo.getPercent()%>%) </font>
						</td>
						<td>단가 : <%=pvo.getP_price()%></td>
					</tr>
			<%
					}
				}
			%>
		
		</tbody>
	</table>
		<div style="display: block; text-align: center; line-height: 50px;
		 border: 1px solid teal; border-radius: 5px; position:relative;
		 top:25px;
		 font-size: 15px; font-weight: bold; color: white; width: 380px;
		 margin: auto;">
			<span><a href="registration.jsp">제품등록</a></span>
		</div>

</body>
</html>
    