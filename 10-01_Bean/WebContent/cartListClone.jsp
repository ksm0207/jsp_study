<%@page import="mybatis.vo.ProductVO"%>
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
	<jsp:include page="menu.jsp"/>
	
	<table id="t1" width="600" border="1" align="center" 
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
<jsp:useBean id="cart" class="shop.bean.Cart" scope="session"/>
<%
	int total = 0;// 총 결재금액
	
	//카트에 저장된 모든 제품들을 배열로 얻어낸다.
	ProductVO[] ar = cart.getList();
	
	if(ar != null){
		for(ProductVO p : ar){
%>
            <tr align="center" onmouseover="overRow(this)">
                <td><%=p.getP_num() %></td>
                <td><%=p.getP_name() %></td>
                <td>
                    정가:<%=p.getP_price() %>원<br>
                    <font color="red">
                        세일가격:<%=p.getP_saleprice() %>원
                    </font>
                </td>
                <td>
                    <!-- 수량 조정 폼 -->
                    <form action="changeCount.jsp" method="post">
                    	<input type="hidden" 
                    		value="<%=p.getP_num() %>" name="p_num"/>
                    	<input type="number" name="count" size="2"
                    		value="<%=p.getQuant() %>"/>
                    	<input type="submit" value="수정"/>
                    </form>
                    <!------------------>
                </td>
                <td><span><%=p.getTotalPrice() %></span>원</td>
                <td>
                <%-- 
                    <input type="button" value="삭제" 
                    style="border:1 solid black;cursor:pointer" 
onclick="javascript:location.href='delProduct.jsp?p_num=<%=p.getP_num()%>'">
				--%>
				<input type="button" value="삭제" 
                    style="border:1 solid black;cursor:pointer" 
                    onclick="del('<%=p.getP_num()%>')"/>
                </td>
            </tr>
<%
			total += p.getTotalPrice();
		}//for문의 끝
	} else {
%>
            <tr align="center">
                <td colspan="6">
                    <b>장바구니가 비었습니다.</b>
                </td>
            </tr>
<%
	}//if문의 끝!
%>            
            <tr>
                <td colspan="5" align="right">총 결재액 : <span id="total"><%=total %></span>원</td>
                <td></td>
            </tr>
        </table>
        
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script>
    	var table = document.getElementById("t1");
    	
		function overRow(tr){
			var r_idx = tr.rowIndex; //해당 행 번호
			table.rowIdx = r_idx; //테이블에 해당 행번호를 
								//rowIdx라는 이름으로 저장	
		}
    	function del(pnum){
    		var chk = confirm("삭제하시겠습니까?");
    		
    		if(chk){
    			var param = "p_num="+encodeURIComponent(pnum);
    			
    			//비동기식 통신
    			$.ajax({
    				url: "delProduct.jsp",
    				data: param,
    				type: "post",
    				dataType: "json",
    			}).done(function(data){
    				if(data.chk){
    					alert("삭제완료!");
    					
    					var total = $("#total").text();//총 결재액
    					
    					var td5 = $("#t1 tr").eq(table.rowIdx).children("td")[4];
    					var money = $(td5).find("span").text();
    					
    					var totalPrice = total-money;
    					
    					$("#total").text(totalPrice);
    					
    					//테이블의 해당 행 삭제!
    					table.deleteRow(table.rowIdx);
    				}
    			});
    		}
    	}
    </script>
</body>
</html>





