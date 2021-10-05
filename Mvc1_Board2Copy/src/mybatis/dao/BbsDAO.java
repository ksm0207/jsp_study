package mybatis.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import mybatis.service3.Service;
import mybatis.vo.BbsVO;

public class BbsDAO {
	
	// 목록
	public static BbsVO[] getList(int begin, int end) {
		
		BbsVO[] arr = null;
		
		SqlSession session = Service.getFactory().openSession();
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("begin", begin);
		map.put("end",end);
		
		List<BbsVO> list = session.selectList("bbs.bbs_list",map);
		
		if(list != null && !list.isEmpty()) {
			
			arr = new BbsVO[list.size()];
			list.toArray(arr); // list -> BbsVO 내용복사.
		}
		session.close();
		
		return arr;
	}
	
	// 총 게시물 수
	public static int getTotalCount() {
		
		SqlSession session = Service.getFactory().openSession();
		
		int total_page = session.selectOne("bbs.total_count");
		
		session.close();
		
		return total_page;
	}
}
