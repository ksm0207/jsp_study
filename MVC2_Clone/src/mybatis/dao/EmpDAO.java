package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.EmpVO;

public class EmpDAO {
	
	// 1. ��� ��ü ���
	public static EmpVO[] getAll() {
		
		EmpVO[] arr = null;
		SqlSession sql = FactoryService.getFactory().openSession();
		
		List<EmpVO> list = sql.selectList("emp.all");
		
		if(list.size() > 0 && list != null) {
			arr = new EmpVO[list.size()];
			list.toArray(arr);
		}
		
		return arr;
	}
	
	// 2. ���ǿ� ���� ���������� ���� ����Ͻ� ����
	
	public static EmpVO[] getList(String searchType , String searchValue) {
		
		EmpVO[] ar = null;
		
		SqlSession sql = FactoryService.getFactory().openSession();
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchType", searchType);
		map.put("searchValue",searchValue);
		
		List<EmpVO> list = sql.selectList("emp.list",map);
		
		if(list.size() > 0 ) {
			
			ar = new EmpVO[list.size()];
			list.toArray(ar);
		}
		sql.close();
	
		return ar;
		
	}
	

}
