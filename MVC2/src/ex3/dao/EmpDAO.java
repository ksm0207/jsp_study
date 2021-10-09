package ex3.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import ex3.service4.Service;
import ex3.vo.EmpVO;

public class EmpDAO {
	
	
	public static EmpVO[] getList(){
		
		EmpVO[] ar = null;
		
		SqlSession sql = Service.getFactory().openSession();
		List<EmpVO> list = sql.selectList("emp.total");
		
		if(list != null && !list.isEmpty()) {
			
			ar = new EmpVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
	public static EmpVO search(String type , String value) {
		
		EmpVO evo = null;
		SqlSession session = Service.getFactory().openSession();
		Map<String,String> map = new HashMap<String, String>();
		
		map.put("searchType", type);
		map.put("query",value);
		
		evo = (EmpVO) session.selectList("emp.testSearch",map);
		
		
		session.close();
		
		return evo;
	}

}
