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
		<jsp:useBean id="shop_bean" class="shop.bean.ShopBean" scope="session"/>
		<jsp:setProperty property="p_num" name="shop_bean" param="prod_num"/>
		
		<%
			ProductVO pvo = shop_bean.getProduct();
		
		%>
		
		
	
	<table align="center" width="600" border ="1" style="border-collapse:collapse;
	       font-size:11px bordercolor="navy" cellpadding="4" cellspacing="0">
		   	<colgroup>
		   		<col width="40%">
		   		<col width="60%">
		   	</colgroup>
			<tbody>
			    <tr>
			        <td>제품Category</td>
			        <td><%=pvo.getCategory() %></td>
			    </tr>
			    <tr>
			        <td>제품번호</td>
			        <td><%=pvo.getP_num() %></td>
			    </tr>
			    <tr>
			        <td>제품이름</td>
			        <td><%=pvo.getP_name() %></td>
			    </tr>
			    <tr>
			        <td>제품 판매사</td>
			        <td><%=pvo.getP_company() %></td>
			    </tr>
			    <tr>
			        <td>제품가격</td>
			        <td>(할인가 : <%=pvo.getP_saleprice() %>원 )</td>
			    </tr>
			    <tr>
			        <td colspan="2">제품설명</td>
			    </tr>
			    <tr>
			        <td colspan="2" align="center"><img src ="images/<%=pvo.getP_image_s()%>" width="100" height="95"></td>
			    </tr>
			    <tr>
			        <td colspan="2"><%=pvo.getP_content() %></td>
			    </tr>
			    <tr>
			        <td colspan="2" align="center">
			            <input type="button" value="장바구니에 담기" 
			            onclick="javascript:location.href='addProduct.jsp?p_num='"/>
			            <input type="button" value="장바구니 보기" 
			            onclick="javascript:location.href='cartList.jsp'"/>
			        </td>
			    </tr> 
		    </tbody>   
		</table>

</body>
</html>