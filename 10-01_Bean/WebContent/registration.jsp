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
	
	<!-- Category com001 ele002 sp003 -->
	
	<form action="create_product.jsp" method="POST">
	
	<table align="center" width="600" border="1"
	style="border-collapse:collapse; font-size: 11px" bordercolor="navy"
	cellpadding="4" cellspacing="0">
		   	<colgroup>
		   		<col width="40%">
		   		<col width="60%">
		   	</colgroup>
			<tbody>
			    <tr>
			        <td>제품Category</td>
			        <td><select>
			        	<option>선택하세요</option>
			        	<option>com001</option>
			        	<option>ele002</option>
			        	<option>sp003</option>
			        </select></td>
			    </tr>
			    <tr>
			        <td>제품번호</td>
			        <td><input type="text" id="p_num" name="p_num"></td>
			    </tr>
			    <tr>
			        <td>제품이름</td>
			        <td><input type="text" id="p_num" name="p_num"></td>
			    </tr>
			    <tr>
			        <td>제품 판매사</td>
			        <td><input type="text" id="p_num" name="p_num"></td>
			    </tr>
			    <tr>
			        <td>제품가격</td>
			        <td><input type="text" id="p_num" name="p_num"
			             placeholder="(할인가 : 0원) "></td>
			    </tr>
			    <tr>
			        <td>제품설명</td>
			        <td><input type="text" id="p_num" name="p_num"
			             placeholder="제품 상세설명을 적어주세요."></td>
			    </tr>
			    <tr>
			        <td colspan="2" align="center"><img src ="images/" /></td>
			    </tr>
			    <tr>
			        <td colspan="2"></td>
			    </tr>
			    <tr>
			       	 <td colspan="2" align="center">
			            <input type="button" value="등록하기"/>  
			        </td>
			    </tr> 
		    </tbody>   
		</table>
	
	</form>
	
</body>
</html>