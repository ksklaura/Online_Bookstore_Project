package mypage;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import bean.Page;
import mybatis.MybaFactory;

public class userMypageDao implements userMypageInterface {
	SqlSession session;
	Page page;
	
	public userMypageDao() {
		session = MybaFactory.getFactory().openSession();
	}

	@Override
	public boolean insert(userMypageVo vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<userMypageVo> select(Page page) {
		List<userMypageVo> list = null;
		
		try {
			int totSize = session.selectOne("mypage.tot_size", page);
			page.setTotSize(totSize);
			page.compute();
			page.setStartNo(page.getStartNo()-1); // 이걸 안 하면 목록의 첫번째 데이터가 누락됨.
			this.page = page;
			
			list = session.selectList("mypage.select", page);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	// 정확하지 않음... ★★★★★
	@Override
	public userMypageVo selectOne(String id) {
		userMypageVo vo = null;
		try {
			vo = session.selectOne("mypage.view", id); // 일단 난 view 페이지가 없음..
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}

	@Override
	public boolean update(userMypageVo vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String id, String pwd) {
		// TODO Auto-generated method stub
		return false;
	}

	public Page getPage() {
		return page;
	}
}
