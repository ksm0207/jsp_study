<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="Controller3?type=res" method="POST">
	
		<select id="select" name="option">
			<option value="0">사번</option>
			<option value="1">이름</option>
			<option value="2">직종</option>
			
		</select>
			<input type="text" id ="id" name="searchValue">
			<button type="submit">검색</button>
	</form>

</body>
</html>