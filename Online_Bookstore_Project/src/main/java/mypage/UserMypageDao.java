package mypage;

import java.util.ArrayList;
import java.util.List;

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
	}
	
	

	@Override
	public boolean insert(UserMypageVo vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<UserMypageVo> select(Page page) {
		List<UserMypageVo> list = null;
		
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
	public UserMypageVo selectOne(String uId) {
		UserMypageVo vo = null;
		try {
			vo = session.selectOne("mypage.view", uId); // 일단 난 view 페이지가 없음..
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
	
	public String userMemberEmailValdation(String email) {
		String result = session.selectOne("mypage.member_email_validation", email);
		return result;
	}
	
	public String userMemberPhoneValdation(String phone) {
		String result = session.selectOne("mypage.member_phone_validation", phone);	
		return result;
	}

	@Override
	public boolean delete(String uId, String pwd) {
		// TODO Auto-generated method stub
		return false;
	}

	public Page getPage() {
		return page;
	}
}
