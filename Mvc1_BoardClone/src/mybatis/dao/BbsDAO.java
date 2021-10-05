package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service3.Service;
import mybatis.vo.BbsVO;

public class BbsDAO {
	
	// 목록
	public static BbsVO[] getList() {
		
		BbsVO[] arr = null;
		
		SqlSession session = Service.getFactory().openSession();
		
		List<BbsVO> list = session.selectList("bbs.bbs_list");
		
		if(list != null && !list.isEmpty()) {
			
			arr = new BbsVO[list.size()];
			list.toArray(arr); // list -> BbsVO 내용복사.
		}
		session.close();
		
		return arr;
		
	}
}
