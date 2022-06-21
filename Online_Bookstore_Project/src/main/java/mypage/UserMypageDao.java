package mypage;

import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.User;
import org.apache.ibatis.session.SqlSession;

import bean.AES;
import bean.Page;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import mybatis.MybaFactory;

public class UserMypageDao implements UserMypageInterface {
	SqlSession session;
	HttpSession s;
	Page page;
	AES aes;
		
	public UserMypageDao() {
		session = MybaFactory.getFactory().openSession();
		aes = new AES();
		page = new Page();
	}


	@Override
	public List<UserMypageVo> selectOrder(String uId) {
		List<UserMypageVo> orderNoList = new ArrayList<UserMypageVo>();
		List<UserMypageVo> list = null;
		try {
			list = session.selectList("mypage.selectFirstOrder",uId);
			
			if(list.size()>0) {
				orderNoList.add(list.get(0));
				int index = 0;
				for(int i=0; i<list.size(); i++) {
					if(!orderNoList.get(index).getOrderNo().equals(list.get(i).getOrderNo())) {
						orderNoList.add(list.get(i));
						index++;
					}
				}
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return orderNoList;
	}

	@Override
	public List<UserMypageVo> selectOrderDetail(Page page) {
		List<UserMypageVo> list = null;
		try {
			int totSize = session.selectOne("mypage.tot_size2", page);
			page.setTotSize(totSize);
			page.compute();
			page.setStartNo(page.getStartNo()-1);
			this.page = page;
			
			list = session.selectList("mypage.viewOrderDetail", page);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
	}


//	@Override 
//	public List<UserMypageVo> searchOrder(Page page) {
//		List<UserMypageVo> list = null;
//		
//		try { 
//			int totSize = session.selectOne("mypage.tot_size2", page);
//			page.setTotSize(totSize); page.compute();
//			page.setStartNo(page.getStartNo()-1); 
//			this.page = page;
//			
//			list = session.selectList("mypage.searchOrder", page); 
//		}catch(Exception e) {
//			e.printStackTrace(); 
//		} 
//		return list; 
//	}
	
	@Override
	public UserMypageVo selectOneInfo(String uId) {
		UserMypageVo vo = null;
		try {
			vo = session.selectOne("mypage.selectOneInfo", uId);
			
			// Date 형식으로 출력되는 생년월일에서 "-"를 없애줌.
			String birth = vo.getBirth();
			birth = birth.replaceAll("[-]", "");
			vo.setBirth(birth);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}

	// 회원정보 수정
	@Override
	public boolean update(UserMypageVo vo) {
		boolean b = false;
		String pwd = aes.enc(vo.getPwd());
		vo.setPwd(pwd);
		int cnt = session.update("mypage.updateInfo", vo);
		if(cnt > 0) {
			b = true;
			session.commit();
		}else {
			session.rollback();
		}
		return b;
	}

	public Page getPage() {
		return page;
	}
}
