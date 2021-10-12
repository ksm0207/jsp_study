package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;

public class EmpDAO {

	// total
	public static EmpVO[] getList() {
		
		SqlSession sql = FactoryService.getFactory().openSession();
		
		EmpVO[] arr = null;
		
		List<EmpVO> list = sql.selectList("emp.total");
		
		try {
	
			if(list.size() > 0 && list != null) {
		
				arr = new EmpVO[list.size()];
				list.toArray(arr);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return arr;
		
	}
	
	// add
	
	public static int add(String employee_id , String first_name,
						  String last_name ,   String email, String job_id,
						  String hire_date,    String department_id) {
		
		SqlSession sql = FactoryService.getFactory().openSession();
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("employee_id", employee_id);
		map.put("first_name", first_name);
		map.put("last_name", last_name);
		map.put("email", email);
		map.put("job_id", job_id);
		map.put("hire_date", hire_date);
		map.put("department_id", department_id);
		
		int res = sql.insert("emp.add",map);
		
		if(res > 0) {
			sql.commit();
		}else {
			sql.rollback();
		}
		sql.close();
		
		return res;
	}
	
	public static EmpVO[] getList(String searchType , String searchValue) {
		
		EmpVO[] ar = null;
		
		SqlSession sql = FactoryService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchValue",searchValue);
		
		List<EmpVO> list = sql.selectList("emp.search",map);
		
		if(list.size() > 0 ) {
			
			ar = new EmpVO[list.size()];
			list.toArray(ar);
		}
		sql.close();
	
		return ar;
		
	}
	
	
}
