package mypage;

import java.util.List;

import bean.Page;

public interface UserMypageInterface {
	//public UserMypageVo selectOneOrder(String uId);
	public List<UserMypageVo> selectOrder(String uId);
	public UserMypageVo selectOneInfo(String uId);
	public List<UserMypageVo> selectOrderDetail(Page page);
	public boolean update(UserMypageVo vo);
}
