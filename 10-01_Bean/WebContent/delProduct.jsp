<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="shop" class="shop.bean.ShopBean" scope="session"/>
<jsp:useBean id="cart" class="shop.bean.Cart" scope="session"/> 

<%
	String del_item = request.getParameter("p_num");
	System.out.println("DelProduct.jsp : "+del_item);
	
	boolean value = cart.delProduct(del_item);
	//response.sendRedirect("product_content.jsp?prod_num="+del_item);
%>
{
	"chk":"<%=value %>"
}