<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
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
	
	div#wrap{
		width: 400px;
		margin: 30px auto;
	}
	
	table th, table td{
		padding: 3px;
	}
	table tbody td>input{
		width: 120px;
		border: 1px solid #27a;
		border-radius: 3px;
		padding: 4px;
	}
	.txt_r{ text-align: right; }
	.phone{ width: 50px; }
	
	.success{ color: #00f; font-weight: bold; font-size: 11px;}
	.fail{ color: #f00; font-weight: bold; font-size: 11px; }
	
	div#box{
		display: inline-block;
		width: 65px;
		height: 20px;
		padding: 0;
		margin: 0;
		margin-left: 3px;
	}
</style>
</head>
<body>
	<div id="wrap">
		<form action="registry.jsp" method="post">
			<table>
				<colgroup>
					<col width="100px"/>
					<col width="*"/>
				</colgroup>
				<tbody>
					<tr>
						<th><label for="s_id">ID:</label></th>
						<td>
							<input type="text" id="s_id" name="id"/>
							<div id="box"></div>
						</td>
					</tr>
					<tr>
						<th><label for="s_pw">PW:</label></th>
						<td>
							<input type="password" id="s_pw" name="pw"/>
						</td>
					</tr>
					<tr>
						<th><label for="s_name">NAME:</label></th>
						<td>
							<input type="text" id="s_name" name="name"/>
						</td>
					</tr>
					
					<%-- 
					<tr>
						<th><label for="s_addr">ADDR:</label></th>
						<td>
							<input type="text" id="s_addr" name="addr"/>
						</td>
					</tr>
					<tr>
						<th><label for="s_phone">PHONE:</label></th>
						<td>
							<input type="text" id="s_phone" name="phone" class="phone"/>
							- <input type="text" name="phone" class="phone"/>
							- <input type="text" name="phone" class="phone"/>
						</td>
					</tr>
					--%>
					<tr>
						<th>
							<label for="s_email">EMAIL:</label>
						</th>
						<td>
							<input type="text" id="s_email" name="email"/>
						</td>
					</tr>					
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2" >
							<p class="btn">
								<a href="javascript:reg()">
									회원가입
								</a>
							</p>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	
		$(function(){
			
			// 사용자가 id를 입력하기위해 키보드를 '누를 때 마다' 이벤트 적용 - keyup
			$("#s_id").on("keyup",function(){
				
				// 사용자가 입력한 아이디 값 가져오기
				let id = $(this).val();
				console.log(id);
				
				// id에 공백이 있는지 없는지 정규표현식을 이용하여 공백을 제거해주자.(☆)
				
				// 아이디가 4자 이상 입력했을경우 
				if(id.trim().length > 3){
					
					$.ajax({
						url : "checkId.jsp",
						type :	"POST",
						data : "u_id=" + encodeURIComponent(id.trim()),
						
					})
					.done(function(result){
						
						$("#box").html(result);
					})
					.fail(function(error) {
						// 서버 요청 실패 시 실패 원인은 서버에서 일어남
						console.log(error);
					});
				}else{
					// 아이디가 4자이하 일 경우 아이디를 제거해주기
					$("#box").html("");
					// 아이디가 4자이상이고 DB조회에 없는 아이디면 사용가능한 아이디 표시
					
				}
			});
		});
		
	</script>
	
</body>
</html>




    