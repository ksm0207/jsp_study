<%@page import="mybatis.vo.MemVO"%>
<%@ page import ="java.io.File" %>    
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	// <%! 자바 멤버 정의
	
	// 사용자 용량을 측정하는 메소드를 구현하기.
	// File 객체를 이용하되 용량을 얻어준다.
	// ※ 폴더는 용량을 구하지 못하고 안에 있는 파일들의 용량을 모두 더해주기 위해
	//   재귀호출 방식을 사용하자.
	public int useSize(File file){
		
		// 1.폴더의 하위요소들의 File용량을 모두 더해주기 전 하위 요소들을 모두 얻어내자.
		File[] list = file.listFiles();
		
		// 2. 파일의 용량을 적재할 변수를 선언 ※ 폴더 일 경우엔 useSize 함수를 다시 호출한다
		int size = 0;
		
		for(File sf : list) {
			
			// 파일이 존재하는경우
			if(sf.isFile()){
				// 용량을 적재한다
				size += sf.length(); 
			}else{
				// 존재하지 않는다면 재귀호출 하기
				size += useSize(sf);
			}
		}
		
		return size;
	}
%>

<%
	// 총 용량이 10mb 일때 어떻게 계산할까 ?
	// 1. 1024byte -> 1KB
	// 2. 1024 * 1024 = 1MB
	// (1MB + 10 = 10MB)
	
	// 3. 1024 * 1024 * 1024 = 1GB
	int totalSize = 1024 * 1024 * 10 ; // 10MB
	int useSize = 0;
	
	// 현재 페이지는 무조건 로그인이 되어 있어야 사용 가능한 페이지 이므로
	// 로그인 여부를 확인해주자.
	
	Object obj = session.getAttribute("mvo");

	if(obj != null) {
		MemVO mvo = (MemVO)obj;
		
		// 현재 사용자가 보고자 하는 현재 위치값을 파라미터를 받는다
		String dir = request.getParameter("cPath");
		
		// 09-29 : 사용자가 폴더를 선택했을 경우 f_name 파라미터로 받아주기.
		String f_name = request.getParameter("f_name");
		
		// cPath : myDisk 버튼을 클릭하고 들어온 경우에는 dir에 null 값을 받음
		if(dir == null){
			// 현재 위치 값을 받지 못한 경우는 해당 id로 지정해준다.
			dir = mvo.getM_id();
		}else{
			
			// 원하는 폴더를 선택 할 경우 수행하는 곳.
			if(f_name != null && f_name.trim().length() > 0){
				dir = dir+"/"+f_name;
			}
		}
		
		// 사용자가 파일올리기를 할 때 현재 위치값을 upload.jsp 서버에 전달해야함!
		// 서버에서는 getParameter() 으로 받기에는 시간적제한이 있으므로..
		// '파라미터가 전달되기 전에' 전달이 가능하도록 만드는 방법은
		// 세션을 이용하여 전달하자.
		session.setAttribute("dir", dir);
%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/js/jquery-3.2.1.js"></script>
<title>Insert title here</title>
<style type="text/css">

	.m_id {
		color: #00f;
		font-weight: bold;
	}
	table{
		width: 600px;
		border: 1px solid #27a;
		border-collapse: collapse;
	}
	table th, table td{
		border: 1px solid #27a;
		padding: 4px;
	}
	table th{ background-color: #bcbcbc; }
	.title { background-color: #bcbcbc; width: 25%; }
	
	.btn{
		display: inline-block;
		width: 70px;
		height: 20px;
		text-align: center;
		padding:0px;	
		margin-right: 20px;	
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
	
	#f_win{
		width: 220px;
		height: 80px;
		padding: 20px;
		border: 1px solid #27a;
		border-radius: 8px;
		background-color: #efefef;
		text-align: center;
		position: absolute;
		top: 150px;
		left: 250px;
		display: none;
	}
	#f_win2{
		width: 300px;
		height: 80px;
		padding: 20px;
		border: 1px solid #27a;
		border-radius: 8px;
		background-color: #efefef;
		text-align: center;
		position: absolute;
		top: 150px;
		left: 250px;
		display: none;
	}
</style>
</head>
<body>
	<h1>My Disk service</h1>
	<hr/><%=mvo.getM_name() %>
	(<span class="m_id"><%=mvo.getM_id()%></span>)님의 디스크
	&nbsp;[<a href="javascript:home()">Home</a>]
	<hr/>
	
	<table summary="사용량을 표시하는 테이블">
		<tbody>
			<tr>
				<th class="title">전체용량</th>
				<td><%=totalSize / 1024 %>KB</td>
			</tr>
			<tr>
				<th class="title">사용량</th>
				<td><%=useSize / 1024 %>KB</td>
			</tr>
			<tr>
				<th class="title">남은용량</th>
				<td><%=(totalSize-useSize)/1024%>KB</td>
			</tr>
		</tbody>
	</table>
	<hr/>
		<div id="btn_area">
			<p class="btn">
				<a href="javascript:selectFile()">
					파일올리기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:makeFolder()">
				
					폴더생성
				</a>
			</p>
			<p class="btn">
				<a href="javascript:exe()">
					파일생성
				</a>
			</p>
		</div>		
	<hr/>
	
	<label for="dir">현재위치:</label>
	<span id="dir"><%=dir%></span>
	
	<table summary="폴더의 내용을 표현하는 테이블">
		<colgroup>
			<col width="50px"/>
			<col width="*"/>
			<col width="80px"/>
		</colgroup>
		<thead>
			<tr>
				<th>구분</th>
				<th>폴더 및 파일명</th>
				<th>삭제여부</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(!dir.equals(mvo.getM_id())){
			// 현재 위치값과 아이디가 다를때의 경우		
			
			// 상위로... 기능구현
			// 예시 : 현재위치 값이 admin/abc/1234 이라고 가정했을때
			//       상위로의 기능은 admin/abc 위치해야한다.
			//       현재위치 값 에서 가장 뒤에있는 /의 index를 얻어내준다음
			//       맨 앞에서 가져온 index까지만 substring 메소드를 사용해준다.
			
			int idx = dir.lastIndexOf("/");
			String upPath = dir.substring(0,idx);
			
		%>
			<tr>
				<td>↑</td>
				<td colspan="2">
					<a href="javascript:goUp('<%=upPath%>')">
						상위로...
					</a>
				</td>
				
			</tr>
		<%
			}
		// 현재 위치 값(dir)을 가지고 절대경로로 만들어주기
		// 생성이유 : File객체를 생성하여 '하위'에 있는 파일 혹은 디렉토리를
		//          얻어주기 위해서 만들어준다.
		String realPath = application.getRealPath("/members/"+dir);
		
		File s_file = new File(realPath);
		File[] sub_list = s_file.listFiles();
		
		for(File f : sub_list){
		
		%>
		<!-- 표현해야하는 곳 -->
		
			<tr>
				<td>
				<%
					if(f.isFile()){
				%>

						<img src="../images/file.png"/>
				<%
					}else{
				%>
						<img src="../images/folder.png"/>
				<%
					}
				%>
				</td>
				<td>
				<%
					if(f.isDirectory()){
				%>
					<!-- gogo : 폴더이동 -->
					<a href="javascript: gogo('<%=f.getName()%>')"><%=f.getName()%></a>
				<%	}else{
				
				%>
					<!-- down : 파일 다운로드 -->
					<a href="javascript:down('<%=f.getName()%>')">
					<%=f.getName() %>
					</a>
				<%
				} 
				
				%>
				</td>
				<td></td>
			</tr>
	<%
		}
	%>
		</tbody>
	</table>
	
	<form name="ff" method="post">
		<input type="hidden" name="f_name"/>
		<input type="hidden" name="cPath" value="<%=dir%>"/>
	</form>
	
	
	<div id="f_win">
		<form action="makeFolder.jsp" method="post" name="frm">
			<input type="hidden" name="cPath" value="<%=dir%>"/>
			<label for="f_name">폴더명:</label>
			<input type="text" id="f_name" name="f_name"/><br/>
			<p class="btn">
				<a href="javascript:newFolder()">
					만들기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:closeWin()">
					닫 기
				</a>
			</p>
		</form>
	</div>
	

	<div id="f_win2">
	<!--  -->
		<form action="upload.jsp" method="post" name="frm2"
		enctype="multipart/form-data">
			<!-- type : hidden 서버에서 받지를 못함. 받긴하지만 null 값뜸. -->
			<!--<input type="hidden" name="cPath" value="<%=dir%>"> -->
			<label for="selectFile">첨부파일:</label>
			<input type="file" id="selectFile" 
				name="upload"/><br/>
				
			<p class="btn">
				<a href="javascript:upload()">
					보내기
				</a>
			</p>
			<p class="btn">
				<a href="javascript:closeWin2()">
					닫 기
				</a>
			</p>
		</form>
	</div>
	
	<script>
	
		// 현재문서에 이름이 ff인 form 객체를 검색한다
		// 검색된 form객체안에 이름이 fname 요소의 값으로
		// 인자로 받은 폴더명을 넣어준다
		function gogo(fname){
			
			document.ff.f_name.value = fname;
			
			// 현재 문서에 이름인 ff인 form의 서버 경로를 myDisk.jsp로 설정하기.
			document.ff.action = 'myDisk.jsp';
			document.ff.submit();
			
		}
		
		// div 아이디가 f_win 요소를 보여주자. css -> display : none 처리되어있음.
		function makeFolder(){
			document.getElementById('f_win').style.display = 'block';
			
			
			
		}
		function newFolder() {
			// cPath
			let cPath = document.getElementsByName("name");
			let f_name = document.getElementById("f_name");
			
			
			f_name = document.frm.f_name.value;
			cPath = document.frm.name.value;
			
			console.log('CPath : '+cPath);
			
			if(f_name.trim().length < 1){
				console.log(f_name);
				alert('생성하고자 하는 폴더명을 입력해주세요.');
				return false;	
			}
		
			document.frm.submit();
		}
		
		function closeWin(){
			document.getElementById('f_win').style.display = 'none';
			
		}
		
		// 파일 업로드 구현 시작
		
		// ※ 업로드 화면보이기
		function selectFile(){
			let f_win2 = document.getElementById('f_win2').style.display ='block';
		}
		// ※ 업로드 화면숨기기
		function closeWin2(){
			document.getElementById('f_win2').style.display = 'none';
		}
		
		function upload(){
			
			// 첨부한 파일 객체 가져오기
			let select_file = document.frm2.upload.value;
			
			if(select_file.trim().length < 1){
				alert('파일을 선택해주세요.');
				return false;
			}
			
			document.frm2.submit();
		}
		
		// 파일 다운로드 구현
		
		function down(file) {
			console.log(file);
			document.ff.f_name.value = file;
			document.ff.action = 'download.jsp';
			document.ff.submit();		
		}
		
		function goUp(top){
			
			/*
			
			let path =  top;
			console.log('Path : '+path);

			let res = path.substring(0, path.lastIndexOf('/'));
			console.log('SubString : '+res);
			
			if(path.length > res.length){
				location.href='myDisk.jsp';
				console.log("0");
				return res;
			}else{
				console.log("1");
				return res;
			}
			*/
			
			document.ff.cPath.value = top;
			document.ff.action = "myDisk.jsp";
			document.ff.submit();
		}
		
		function home(){
			
			location.href='../index.jsp';
		}
	
		
	</script>

	
</body>
</html>
<% 
	}else{
		
%>
	<script>
		alert('로그인 후 사용하세요 !');
		parent.location.href='../index.jsp';
	</script>
<%

	}
%>