<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<input type="file" onchange="setThumbnail(event);"/> 
	<div id="image_container"></div>

<script> 
function setThumbnail(event) {
	let reader = new FileReader();
	reader.onload = function(event) {
		let img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		document.querySelector("div#image_container").appendChild(img); 
	};
	reader.readAsDataURL(event.target.files[0]); } 
	</script>



</body>
</html>