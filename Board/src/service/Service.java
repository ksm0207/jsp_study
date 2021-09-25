package service;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class Service {
	
	private static SqlSessionFactory factory;
	
	// Static 초기화 영역
	static {
		try {
			
			Reader reader = Resources.getResourceAsReader("config/config.xml");
			factory = new SqlSessionFactoryBuilder().build(reader);
			reader.close();
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSessionFactory getFactory() {
		
		return factory;
	}

}
