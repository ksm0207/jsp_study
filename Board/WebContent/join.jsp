<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Jsp 게시판 만들기</title>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
			        data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
			        aria-expanded="false">
			
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
						
			</button>
			<a class="navbar-brand" href="#">Board</a>
		</div>
		
		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
			
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">메인화면</a></li>
				<li><a href="board.jsp">게시판</a></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown"
					 role="button" aria-haspopup="true"
					 aria-expanded="false">접속하기
					 <span class="caret"></span>
					 </a>
					 
					 <ul class="dropdown-menu">
					 	<li><a href="login.jsp">로그인</a></li>
					 	<li class="active"><a href="join.jsp">회원가입</a></li>
					 </ul>	
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px">
				<form method="POST" action="JoinAction.jsp">
					<h3 style="text-align: center;">Join</h3>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID"
						 name="user_id" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="password" class="form-control" placeholder="PassWord"
						 name="user_pw" maxlength="20">
					</div>
					
					<div class="form-group">
						<input type="text" class="form-control" placeholder="name"
						 name="user_name" maxlength="20">
					</div>
					
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active">
								<input type="radio" name="user_gender"
						 			   autocomplete="off"  value="남자" checked>Man 
							</label>
							
							<label class="btn btn-primary active">
								<input type="radio" name="user_gender"
						 			   autocomplete="off"  value="여자" checked>Girl
							</label>
						</div>	
					</div>
				
					<div class="form-group">
						<input type="email" class="form-control" placeholder="abc@gmail.com"
						 name="user_email" maxlength="50">
					</div>
					
					<input type="submit" class="btn btn-primary form-control" value="Sing Up">
				</form>
			</div>
		</div>
	</div>
	

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>