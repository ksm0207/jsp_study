package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SingUpServlet
 */
@WebServlet("/SingUpServlet")
public class SingUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SingUpServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 요청시 한글 처리 해주는 메소드
		request.setCharacterEncoding("UTF-8");
		// 응답시 한글 처리 해주는 메소드
		response.setContentType("text/html; charset=UTF-8");
		
		// Parsing(SingUp.html)된 문서로부터 넘어오는 파라미터를 받아서 처리하기.
		
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		// 그후 응답을 위한 스트림을 준비
		PrintWriter out = response.getWriter();
		
		String msg = "<h1>이름 : " + name + " 나이 : " + age + " 연락처 : " + phone + " 주소 : " + address +"</h1>" + "테스트완료!";
		
		out.println(msg);
		
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
