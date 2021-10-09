package ex3;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xalan.internal.xsltc.compiler.util.RealType;

/**
 * Servlet implementation class Controller3
 */
@WebServlet(urlPatterns = {"/Controller3"},
 initParams = {
	@WebInitParam(name ="myParam",value="/WEB-INF/action.properties") 
 })
public class Controller3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 초기파라미터로 전달된 action.properties 파일의 경로를 가지고
	// 파일의 내용을 가져와서 객체로 생성해보는 연습.
    // 객체를 생성하면 저장할 곳이 필요함 
	// 파일은 Map구조를 파일화 시켰으므로 Map구조로 저장하여 만들어보도록 하자.
	
	private Map<String,Action> actionMap;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller3() {
        super();
        actionMap = new HashMap<String, Action>();
    }
    
    // 생성자 다음으로 호출하는 메소드를 구현.
	@Override
	public void init() throws ServletException {
		
		// 첫 요청자에 의해 단 한번만 수행하는 역할을 함.
		super.init();
		// 현재 서블릿이 생성되면 전달받은 초기 파라미터를 가지고온다.
		// props_path : /WEB-INF/action.properties 경로를 가진다
		String props_path = getInitParameter("myParam");
		System.out.println("Props_path : " + props_path);
	
		// 객체생성
		Properties props = new Properties();
		
		// 파일의 내용을 결과를 
		// Properties 객체에 옮겨놓기 위해서 Stream 객체를 만들어준다.
		// Properties load 메소드를 이용하여 내용을 읽기 할 수 있다
		FileInputStream fis = null;
		
		
	try {
		// 읽고
		fis = new FileInputStream(getPropertiesFile(props_path));
		// 저장하고
		props.load(fis); // action.properties파일의 내용을 읽은다음
						 // Properties 객체에 K,V 쌍으로 저장해준다
						 // 예 : greet -> ex3.GreetAction
		System.out.println("읽은내용 : "+ props);
		
		} catch (Exception error) {
			error.printStackTrace();
		}
		
		// 생성할 객체들의 경로가 모두 Properties 객체로 저장되었지만
		// 현재 Controller 입장에서를 보면 생성할 객체가 모르기때문에
		// Properties에 저장된 Key값을 Iterator를 활용하여 반환하도록 하자.
		
		// ketSet() 메소드가 무엇을 반환하고 가져야만 하는지 검색해서 알아보기.
		// ▼ iter : greet , hello , now Key값을 가지고있음
	
		Iterator<Object> iter = props.keySet().iterator();
		
		// Key를 모두 얻었으니 연결된 클래스경로를 하나씩 꺼내서 객체를 생성해보자.
		// 그 다음 actionMap에 저장하도록 하기.
		
		while(iter.hasNext()) {
			// key값은 String 형으로 형변환은 필수!
			String key = (String)iter.next();
			System.out.println("Key : " + key);
			
			// 얻어낸 Key 와 연결된 값을 얻어보자.
			String res = props.getProperty(key);
			System.out.println("Result : " + res);
			
			
			try {
				Object obj = Class.forName(res).newInstance();
				System.out.println("Class.forName = " + obj);
				// Class를 통해 클래스의 정확한 클래스의 경로가 있다면
				// forName().newInstance()로 객체를 생성할 수 있음.
				// newInstance()로 명시적 객체생성으로 하는것과 같다. new
				
				// 생성된 객체는 Action으로 형변환하여 map구조에 저장해주자.
				actionMap.put(key, (Action)obj);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		};
		
		
	}



	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		
		// type이 null이면 기본객체를 인식할 수 있도록 "greet"를 넣어주자
		if(type == null) {
			type = "greet";
		}
		
		// type으로 받은 값은 actionMap의 key로 사용되고 있으므로
		// 원하는 객체를 얻어보자
		Action action = actionMap.get(type);
		
		String viewPath = action.excute(request, response);
		
		RequestDispatcher disp = request.getRequestDispatcher(viewPath);
		disp.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String getPropertiesFile(String path) {
		
		// 받은 파일의 경로를 절대경로화를 시켜준다 | 서블릿에서는 application을 직접구함
		ServletContext context = getServletContext();
		String realPath = context.getRealPath(path);
		
		// 절대경로를 만들어준 이유는 파일의 있는 내용을 읽어올려고 만들어주었다.
		// 읽어오는 내용들은 Action 즉 파일에 정의한 내용들을 읽어줘야함
		// 읽어들인 내용은 Properties 객체에 담아주도록 하자.
		try {
			if(realPath.length() > 0 && realPath != null)
				return realPath;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
}
