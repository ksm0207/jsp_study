<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/summernote-lite.css">

<style>
	table caption {
		text-indent: -9999px;
		height : 0;
	}
	.btn{
		width: 70px;
		height: 20px;
		padding: 0;
		
	}
	.btn a {
		display: block;
		width: 100%;
		padding: 4px;
		height: 20px;
		line-height: 20px;
		background: #27a;
		color:#fff;
		border-radius: 3px;
		text-decoration: none;
		font-weight: bold;
		font-size:12px;
		
	}
	.btn a:hover{
		background: #fff;
		color:#27a;
		border:1px solid #27a;
	}
</style>



</head>
<body>
	<div id="wrap">
		<header>
			<h1>Summer Note (Edit)Test!</h1>
		</header>
		<article>
			<form action="" method="post" name="frm">
				<table>
					<caption>imp:Form</caption>
					
					<colgroup>
						<col width="100px">
						<col width="*">
					</colgroup>
					
					<tbody>
						<tr>
							<th><label for="title">제목:</label></th>
							<td>
								<input type="text" id="title" name="title">
							</td>
						</tr>
						
						<tr>
						
							<th><label for="part">구분:</label></th>
							<td>
								<select id="part" name="part">
									<option>선택하세요</option>		
									<option value="language">프로그래밍</option>		
									<option value="db">데이터베이스</option>		
									<option value="os">운영체제</option>		
								</select>
							</td>
						</tr>
						
						<tr>
						
							<th><label for="plat">플랫폼:</label></th>
							<td>
								<input type="radio" id="plat1" name="plat" value="mobile">모바일&nbsp;
								<input type="radio" id="plat2" name="plat" value="desktop">데스크탑&nbsp;
								<input type="radio" id="plat3" name="plat" value="tablet">테블릿&nbsp;
								
							</td>
							
						</tr>
						
						<tr>
						
							<th><label for="plat">관심분야:</label></th>
							<td>
							
								<input type="checkbox" id="interest1" name="interest" value="blockchain">블록체인&nbsp;
								<input type="checkbox" id="interest2" name="interest" value="iot">사물인터넷&nbsp;
								<input type="checkbox" id="interest3" name="interest" value="car">자동차&nbsp;
								<input type="checkbox" id="interest4" name="interest" value="metaberse">메타버스&nbsp;
								
							</td>
							
						</tr>
							<tr>
								<th><label for="content">내용 :</label></th>
							
								<td>
									<textarea id="content" name="content" rows="12" cols="50"></textarea>
								</td>
							</tr>
							
							<tr>
								
							
								<td colspan="2">
									<p class="btn">
										<a href="javascript:exe()">보내기</a>
									</p>
								</td>
							</tr>
					</tbody>
				</table>
			</form>
		</article>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="../js/summernote-lite.js"></script>
	<script src="../js/lang/summernote-ko-KR.js"></script>
	<script>
	
		$(function(){
			$("#content").summernote({
				lang: "ko-KR",
				width:550,
				height:300,
				minHeight:200,
				maxHeight:400,
				callbacks:{
               	 	onImageUpload:function(files, editor){
                  //이미지가 에디터에 추가될 때마다 수행하는 곳!
                  //이미지를 첨부하면 배열로 인식된다.
                  //이것을 서버로 비동기식 통신을 수행하면
                  //서버에 업로드를 시킬 수 있다.
                  for(var i=0; i<files.length; i++)
                  {
                     sendImage(files[i], editor)//이미지를 서버에 업로드
                  }
               	 	}
			  	}
			});
				
			  	
			// 서버로 이미지파일을 보내기위한 폼객체를 준비하기.
			function sendImage(file,editor){
				
				// 서버로 이미지파일을 보내기위한 폼객체를 준비하기.
				let frm = new FormData();
				
				// key- value -> 한쌍으로 데이터를 파라미터 값으로 저장해준다음
				//               비동기식 으로 데이터를 처리해보자.
				frm.append("upload",file);
				
				$.ajax({
					url: "saveImage.jsp",
					data : frm,
					type : "POST",
					contentType:false,
					processData:false,
				})
				.done(function(data){
					// 이미지가 서버의 uplaod_img폴더에 저장 성공 시
					// 경로를 img_url 이라는 이름으로 data에 저장되어 넘어온다
					// 받은 이미지 경로를 가지고 img 태그를 만든 후
					// 에디터에 넣어보도록 하자
					const image = $("<img>").attr("src", data)
					// image : <img src="/upload_img/test.jpg>"
					$("#content").summernote("insertNode",image[0]);
					alert("Done");
					
					
					
				})
				.fail(function(data){
					alert("fail");
				})
				
			}
			
			
		})
	
	</script>



</body>
</html>