<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
   request.setCharacterEncoding("UTF-8");
   
   String cPath = request.getParameter("cPath");
   String f_name = request.getParameter("f_name");
   
   String realPath = application.getRealPath("/upload/"+f_name);

   // ServletOutputStream
   // 1. 응답을 하는곳은 접속자 PC이다
   // 2. 다운로드를 시켜야 하기 때문에 response를 통해 스트림을 생성해준다.
   // 3. response로부터 얻어지는 OutputStream은 ServletOutputStream 객체
   
   File f = new File(realPath);
   
   if(f.exists()){
      
      BufferedInputStream bis = null;
      FileInputStream fis = null;
      
      BufferedOutputStream bos = null;
      ServletOutputStream sos = null;
      
      byte[] buf = new byte[4069];
      int size = -1;
      
      try{
         // 1. 다운로드 창 화면 띄우기
         response.setContentType("application/x-msdownload");
         response.setHeader("Content-Disposition",
               "attachment;filename="+ new String(f_name.getBytes(),"8859_1"));
         // 창 화면 작업 끝
         
         
         // 2. 다운로드를 진행 할 File과 연결되는 스트림 생성
         fis = new FileInputStream(f);
         bis = new BufferedInputStream(fis);
         
         // 응답을 통해 이미 outputStream 내장객체가 존재하므로
         // 오류가 발생하므로 잠시 없애주자.
         out.clear(); // 이미 호출 된 상태 이므로 비워주고!
         out = pageContext.pushBody(); // 페이지 정보를 저장하는 기능을 부여
         
         sos = response.getOutputStream();
         bos = new BufferedOutputStream(sos);
      
         while((size= bis.read(buf)) != -1 ){
            // 파일 쓰기
            bos.write(buf,0,size);
            bos.flush();
         }
         
      }catch(Exception error){
         error.printStackTrace();
      }finally{
         try{
            
            if(fis != null){
               fis.close();
            }
            
            if(bis != null){
               bis.close();
            }
            
            if(sos != null){
               sos.close();
            }
            
            if(bos != null){
               bos.close();
            }
            
         }catch(Exception error2){
            error2.printStackTrace();
         }
      }
   
   }

%>

 