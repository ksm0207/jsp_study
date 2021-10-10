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
			@WebInitParam(name="param",value="/WEB-INF/bean.properties")
	})

public class PropertiesController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Map<String,Action> actionMap;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PropertiesController() {
        super();
        actionMap = new HashMap<String, Action>();
    }
    
    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    	super.init();
    	
    	Properties props = new Properties();
    	FileInputStream fis = null;
    	
    	String propsPath = getInitParameter("param");
    	System.out.println("propsPath : " + propsPath);
    	
    	ServletContext context = getServletContext();
    	String realPath = context.getRealPath(propsPath);
    	
    	
    	
    	
		try {
    		
    		fis = new FileInputStream(realPath);
    		props.load(fis);
    		System.out.println("파일 내용 : " + props);
    		
    	}catch (Exception e) {
			// TODO: handle exception
		}
		
		Iterator<Object> iter =  props.keySet().iterator();
		
		while(iter.hasNext()) {
			
			String key = (String)iter.next();
			System.out.println("Key 값 : " + key);
			
			String getPros = props.getProperty(key);
			System.out.println("getPros : " + getPros);
			
			try {
				Object obj = Class.forName(getPros).newInstance();
				System.out.println("Class.forName : " + obj);
				
				actionMap.put(key, (Action) obj);
				System.out.println("ActionMap Size : "+actionMap.size());
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = request.getParameter("search");
		System.out.println("Search : " + search);
		
		if(search == null) {
			search = "index";
		}
		
		Action action = actionMap.get(search);
		
		String location = action.getList(request, response);

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
