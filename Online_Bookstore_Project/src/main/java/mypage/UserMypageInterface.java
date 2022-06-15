package mypage;

import java.util.List;

import bean.Page;

public interface UserMypageInterface {
	public boolean insert(UserMypageVo vo);
	public List<UserMypageVo> select(Page page); // 확신이 없는데..
	public UserMypageVo selectOne(String id);
	public boolean update(UserMypageVo vo);
	public String userMemberEmailValdation(String email);
	public String userMemberPhoneValdation(String phone);
	public boolean delete(String uId, String pwd);
}
