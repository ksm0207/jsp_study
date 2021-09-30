<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/summernote-lite.css">
</head>
<body>
	<form>
		<textarea style="height: 350px;" id="content" name="s_content"  rows="12" cols="50"></textarea>
	</form>
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="../js/summernote-lite.js"></script>
	<script src="../js/lang/summernote-ko-KR.js"></script>
	<script>
	
		$(function(){
			$("#content").summernote({
				lang: "ko-KR"
			});
		})
	
	</script>

</body>
</html>