<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="shop" class="shop.bean.ShopBean" scope="session"/>
<jsp:useBean id="cart" class="shop.bean.Cart" scope="session"/>

<%
	String p_num = request.getParameter("p_num");
	String count = request.getParameter("count");
	
	int q = Integer.parseInt(count);
	
	cart.changeCount(p_num, q);

%>

<script>
	alert('수정완료');
	location.href='cartList.jsp';
</script>

