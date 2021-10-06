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
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<jsp:include page="menu.jsp"></jsp:include>
	<jsp:useBean id="cart" class="shop.bean.Cart" scope="session"/>
	
	<%
		int total = 0;
		ProductVO[] vo = cart.getList();
	%>
	
	<table id="table" width="600" border="1" align="center" 
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
										   <!-- 마우스감지 이벤트 | 행을 지우기위한 이벤트  -->
            <tr align="center" onmouseover="overRow(this)">
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
                <%-- 
                    <input type="button" value="삭제" 
                    style="border:1 solid black;cursor:pointer" 
onclick="javascript:location.href='delProduct.jsp?p_num=<%=pvo.getP_num()%>'">
				--%>
				
				<input type="button" value="삭제" 
                    style="border:1 solid black;cursor:pointer" 
onclick="del('<%=pvo.getP_num()%>')">
				
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
                <td colspan="5" align="right">총 결재액 :<span id="total"><%=total %>원 </span></td>
                <td></td>
            </tr>
    
        </table>
        
        <script>
            const table = document.getElementById('table');
	    	function overRow(row){
	    		
	    		let idx = row.rowIndex; // 해당 '행'의 번호
	    		console.log(idx);
	    		table.rowIdx = idx; // 테이블에 행 번호를 저장하기
	    		
	    	}
        
        	function del(p_num){
       			
        		let check = confirm('삭제하시겠습니까?');
        		
        		if(check){
        			const param = "p_num="+encodeURIComponent(p_num);
        			console.log(param);
        			
        			$.ajax({
        				
        				url : "delProduct.jsp",
        				data : param,
        				type: "POST",
        				dataType:"json",
        			})
        			.done(function(data){
        				
        				if(data.chk){
        					alert(data.chk);
        				
        					let total = $("#total").text();
        					// let tbody = $("#table tbody td:nth-child("+(4+1)+")").text();
        					let tbody = $("#table tr").eq(table.rowIdx).children("td")[4];
        					
        					let money = $(tbody).find("span").text();
        					
        					let totalPrice = total - money;
        					
        					$("#total").text(totalPrice);

 							table.deleteRow(table.rowIdx);
        					
        					/*
        				 
        					console.log("Tbody : "+tbody);
        					
        					let split = total.split('원');
        					
        					let totalPrice =  parseInt(split[0]);
        					console.log("TotalPrice == "+ totalPrice);
        					let salePrice = tbody;
        					console.log("SalePrice ==" + salePrice);
        					
        					let result = totalPrice - salePrice ;
        					
        					console.log(result);
        					*/
        					
        					
        					
        				}
        				
        			});
        		}
        	}
        	
       		
       
       	</script>
	

</body>
</html>