package mypage;

import java.util.List;

import bean.Page;

public interface UserMypageInterface {
	public boolean insert(UserMypageVo vo);
	public List<UserMypageVo> selectOrder(Page page);
	public UserMypageVo selectOneInfo(String uId);
	public boolean update(UserMypageVo vo);
	public boolean delete(String uId, String pwd);
}
