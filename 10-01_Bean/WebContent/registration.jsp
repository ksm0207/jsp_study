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
	
	<form action="create_product.jsp" method="POST" enctype="multipart/form-data"
	name ="create">
	
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
			        <td><select id="category" name="category">
			        	<option>선택하세요</option>
			        	<option value="com001">com001</option>
			        	<option value="ele002">ele002</option>
			        	<option value="sp003">sp003</option>
			        </select></td>
			    </tr>
			    <tr>
			        <td>제품번호</td>
			        <td><input type="text" id="p_num" name="p_num"></td>
			    </tr>
			    <tr>
			        <td>제품이름</td>
			        <td><input type="text" id="p_name" name="p_name"></td>
			    </tr>
			    <tr>
			        <td>제품 판매사</td>
			        <td><input type="text" id="p_company" name="p_company"></td>
			    </tr>
			    <tr>
			        <td>제품가격</td>
			        <td>
			        	<input type="text" id="p_price" name="p_price"
			             placeholder="(정가) ">
			             <input type="text" id="p_saleprice" name="p_saleprice"
			             placeholder="(할인가 : 0원) ">
		             </td>
			    </tr>
			    <tr>
			        <td>제품설명</td>
			        <td><input type="text" id="p_content" name="p_content"
			             placeholder="제품 상세설명을 적어주세요."></td>
			    </tr>
			    <tr>
			        <td colspan="2" align="center">
			        <input type="file" id="p_image_s" name="p_image_s" onchange="setThumbnail(event);"/> 
			        <div id="image">
			        
			        </div>
			        <!--   <img src ="images/" /> -->
			        
			        </td>
			    </tr>
			    <tr>
			        <td colspan="2"></td>
			    </tr>
			    <tr>
			       	 <td colspan="2" align="center">
			            <input type="button" onclick="reg(this.form);" value="등록하기"/>  
			        </td>
			    </tr> 
		    </tbody>   
		</table>
	</form>
	
<script> 
	function setThumbnail(event) {
	
	let reader = new FileReader();
	reader.onload = function(event) {
		
		let img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#image").appendChild(img); 
	};
	
		reader.readAsDataURL(event.target.files[0]); 
	
	}
	
	function reg(form){
		
		let category = document.getElementById('category').value;
		let p_num = document.getElementById('p_num').value;
		let p_name = document.getElementById('p_name').value;
		let p_com = document.getElementById('p_company').value;
		let p_price = document.getElementById('p_price').value;
		let p_saleprice = document.getElementById('p_saleprice').value;
		let p_content = document.getElementById('p_content').value;
		let p_image_s = document.getElementById('p_image_s').value;
		
		console.log(p_image_s);
		
		if (p_num.trim().length < 1){
			alert('제품번호를 입력하세요.');
			form.p_num.focus();
			return false;
		}
		
		if (p_name.trim().length < 1){
			alert('제품이름을 입력하세요.');
			form.p_name.focus();
			return false;
		}
		
		if (p_com.trim().length < 1){
			alert('판매사를 입력하세요.');
			form.p_com.focus();
			return false;
		}
		
		if (p_price.trim().length < 1){
			alert('가격을 입력하세요.');
			form.p_price.focus();
			return false;
		}
		
		if (p_content.trim().length < 1){
			alert('제품설명을 입력하세요.');
			form.p_content.focus();
			return false;
		}
		
		document.create.action="create_product.jsp";
		document.create.submit();
		
		
	}


</script>

	
</body>
</html>