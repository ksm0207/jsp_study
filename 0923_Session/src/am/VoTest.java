package am;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.ExVO;

/**
 * Servlet implementation class VoTest
 */
@WebServlet("/VoTest")
public class VoTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VoTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ExVO vo = new ExVO("admin", "Kim", "ksm0207@gmail.com");
		
		// HttpSession 얻기
		
		HttpSession session = request.getSession();
		
		// 가져온 세션을 VO객체에 저장하기
		
		session.setAttribute("user", vo);
		
		// 응답시 한글 처리
		
		response.setContentType("text/html; charset=UTF-8");
		
		// 응답을 위한 요청 객체
		
		PrintWriter out = response.getWriter();
		
		// 결과처리
	
		out.print("<script> location.href='Ex2_HttpSession2' </script>");
		
		out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
