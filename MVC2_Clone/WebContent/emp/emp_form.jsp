<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	

	<form action="Controller">
	
		<select name="searchType">
			<option value="0">사번</option>	
			<option value="1">이름</option>	
			<option value="2">직종</option>	
		</select>	
		
		<input type="text" name="searchValue">
		<input type="submit" value="전송">
		
		<input type="hidden" name = "search" value="result">
		
	</form>

</body>
</html>