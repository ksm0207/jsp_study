package Controller;

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

import inter.Action;

/**
 * Servlet implementation class PropertiesController
 */
@WebServlet( urlPatterns = {"/PropertiesController"},
	initParams = {
			@WebInitParam(name="param",value="/WEB-INF/prop/bean.properties")
	})

public class PropertiesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Map<String,Action> actionMap;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PropertiesController() {
        super();
        actionMap = new HashMap<String, Action>();
    }
    
    @Override
    public void init() throws ServletException {
    	super.init();
    	
    	Properties props = new Properties();
    	FileInputStream fis = null;
    	
    	String propsPath = getInitParameter("param");
    	System.out.println(propsPath);
    	
    	ServletContext context = getServletContext();
    	String realPath = context.getRealPath(propsPath);
    	System.out.println(realPath);
    	
    	try {
    
    		fis = new FileInputStream(realPath);
    		props.load(fis);
    		System.out.println("파일 내용 : " + props);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
    	
    	Iterator<Object> iter = props.keySet().iterator();
    	
    	while(iter.hasNext()) {
    		
    		String key = (String)iter.next(); // true -> key
    		System.out.println("Key : " + key);
    		String value = props.getProperty(key); // 이 속성 목록에서 지정한 키를 사용하여 속성을 검색하고 속성을 반환합니다
    		System.out.println("Value : " + value);
    		
    		try {
    			
				Object obj = Class.forName(value).newInstance();
				actionMap.put(key, (Action)obj);
				
    		}catch (Exception e) {
    			e.printStackTrace();
			}
    	}
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String param = request.getParameter("search");
		
		if(param == null) {
			param = "index";
		}
		
		Action action = actionMap.get(param);
		
		String location = action.getList(request, response);
		System.out.println("Location : "+location);
		
		RequestDispatcher disp = request.getRequestDispatcher(location);
		disp.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
