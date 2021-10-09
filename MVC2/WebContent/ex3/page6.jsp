<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="Controller3" method="POST">
	
		<select name="searchType">
			<option value="0">사번</option>
			<option value="1">이름</option>
			<option value="2">직종</option>
		</select>
		
		<input type="text" id = "searchValue" name="searchValue">
		<input type="button" onclick="send(this.form)" value="전송하기">
		<input type="hidden" name="type" value="res">
	</form>
	
	<script>
	
		function send(form){
			const val = form.searchValue.value;
			console.log(val);
			
			if(val.trim().length < 1){
				alert("값을 입력하세요.");
				form.searchValue.focus();
				return false;
			}else{
				
				form.submit();
			}
			
			
		}
	
	</script>




</body>
</html>