<%@page import="mybatis.vo.MemVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">
	.btn{
		width: 70px;
		height: 20px;
		text-align: center;
		padding:0px;		
	}
	.btn a{
		display: block;
		width: 100%;
		padding: 4px;
		height: 20px;
		line-height: 20px;
		background: #27a;
		color: #fff;
		border-radius: 3px;
		text-decoration: none;
		font-size: 12px;
		font-weight: bold;
	}
	.btn a:hover{
		background: #fff;
		color: #27a;
		border: 1px solid #27a;
	}
	
	#s_id, #s_pw{
		width: 80px;
		border: 1px solid #27a;
		border-radius: 3px;
		padding: 4px;
	}
	div#log_fail, div#log_suc{
		width: 170px;
		border: 1px solid #27a;
		border-radius: 3px;
	}
	.hide{ display: none; }
	.show{ display: block; }
	.txt_r{ padding-left: 10px;}
</style>
</head>
<body>

	<!-- if 영역 -->
	
	<%
		session = request.getSession();
		MemVO mvo = (MemVO) session.getAttribute("mvo");
		// Object obj = session.getAttribute("mvo");
	
		if(mvo == null){
	%>
	<div id="log_fail" class="">
		
		<form action="" method="post">
			<table>
				<colgroup>
					<col width="50px"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<td><label for="s_id">ID:</label></td>
						<td>
							<input type="text" id="s_id" name="u_id"/>
						</td>
					</tr>
					<tr>
						<td><label for="s_pw">PW:</label></td>
						<td>
							<input type="password" id="s_pw" name="u_pw"/>
						</td>
					</tr>
					<tr>
						<td>
							<p class="btn">
								<a href="javascript:exe()">
									로그인
								</a>
							</p>							
						</td>
						<td class="txt_r">
							<p class="btn">
								<a href="javascript:reg()">
									회원가입
								</a>
							</p>							
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<%}else{
	
	%>
	<!-- else 영역 -->
	<div id="log_suc" class="">
		
		<p><%=mvo.getM_name() +" 님 안녕하세요 ?"%> </p>
		<p class="btn">
			<a href="logout.jsp">로그아웃</a>
		</p>
		<p class="btn">
			<a href="javascript:memo()">메모장</a>
		</p>
		<p class="btn">
			<a href="javascript:myDisk()">MyDisk</a>
		</p>
	</div>
	<%
		}
	%>

	<form>
		<input type="hidden" name="res" id="res" value=""/>
	</form>
	
	<!-- Script -->
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	
		// 회원가입 창 열기 function
		function reg() {
			parent.right.location.href ='reg.jsp';
		}
		
		function exe(){
			
			// 유효성 검사
			
			let id = document.getElementById("s_id").value;
			let pw = document.getElementById("s_pw").value;
			
			if(id.trim().length < 1){
				alert('아이디를 입력해주세요.');
				return false;
			}
			
			if(pw.trim().length < 1){
				alert('비밀번호를 입력해주세요.');
				return false;
			}
			
			// 현재문서에서 첫번째 폼의 action 변경 후 데이터 전송
			document.forms[0].action = 'login.jsp';
			document.forms[0].submit();
			
		}
		
		function myDisk(){
			parent.location.href = 'disk/myDisk.jsp';
		}
		
	</script>
	
	
	
</body>
</html>




